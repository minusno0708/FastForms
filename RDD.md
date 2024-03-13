# FastFormsの要件定義書

## 概要
素早く手軽にアンケートを作成できるWebアプリケーションを作成する

## システム構成
- アプリケーション: Phoenix Framework
- データベース: PostgreSQL

## 機能要件
### フロントエンド
- ホーム画面
    - パス:/
    - 概要:アプリケーションの最初のページ
    - 内容
        - フォーム作成画面への遷移
        - フォームID検索によるフォーム画面への遷移
- フォーム作成画面
    - パス:/create
    - 概要:新規アンケートフォームを作成するページ
    - 内容
        - 下記の情報を入力する項目
            - フォームタイトル
            - 選択欄
        - フォーム作成時にフォーム画面へリダイレクト
- フォーム画面
    - パス:/[:form_id]
    - 概要:各フォームについてのページ
    - 内容
        - フォーム回答結果
        - フォーム回答画面のリンク
            - QRコード
            - URL
        - フォーム編集画面への遷移
- フォーム回答画面
    - パス:/[:form_id]/answer
    - 概要:各フォームの回答ページ
    - 内容
        - フォーム回答欄
        - フォーム画面への遷移
        - フォーム回答時にフォーム画面へリダイレクト
- フォーム編集画面
    - パス:/[:form_id]/edit
    - 概要:各フォームの修正ページ
    - 内容
        - フォームタイトル編集
        - フォームの選択項目編集
        - フォームの選択項目の追加
        - フォームの選択項目の削除

### データベース
- Questions
    - UUID String
    - Title String
    - Type Number
        - 1 単一選択
        - 2 複数選択
    - Deadline Date
- Choices
    - Content String
    - FormID ForeignKey[Forms]
- Answers
    - FormID ForeignKey[Forms]
    - ChoiceID Array[Foreignkey[Choices]]

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CCC24C9A32
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Mar 2022 01:55:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233820AbiCBA41 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Mar 2022 19:56:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231641AbiCBA40 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Mar 2022 19:56:26 -0500
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6437A39B92
        for <linux-i2c@vger.kernel.org>; Tue,  1 Mar 2022 16:55:44 -0800 (PST)
Received: by mail-qt1-x82c.google.com with SMTP id q10so310354qtw.4
        for <linux-i2c@vger.kernel.org>; Tue, 01 Mar 2022 16:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=hjKdxeFD5vtwqdjV3V6Ma/CRLQW4KSqRce9D0z79v8o=;
        b=YeRlX/litRjF6p//YlUSLLEINz56167rG49MMFzCLtEoRQuOy0OtC2aPzXtbvaf2Zr
         V28iyTZmhOSufzHBxBB6yC6ghmjB2izZJ/sz7U7oAAWATfTAuHkR1MdWABy1RN+997XT
         sAwkeikbwPWXdEz09ALeFR31K+0/QRpv7UtGb+EA5e+yfYD2QQR7HVNUrW8B8vRi1GFT
         etoDX4JQqQ6Coy87yHqZVIjDFuKpF6R45jZP6iFfR8wT6iQJ+Yn98KC1u1CbAk29Yumr
         yPsvuLX03sZSci1BKBwgoO7H/6R2mE+Zn1Y/neav0nfOoSS5PeIblELBQ6K7D4SuObUT
         BfMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=hjKdxeFD5vtwqdjV3V6Ma/CRLQW4KSqRce9D0z79v8o=;
        b=I7HA4tEj0uCD2FdUHH5fQaix9JNpiOTLRe/a8f6B66z18vjYTzh0bi7Y4dhLloqgCr
         M2unkutzOXL6zIi9ry15GDzhvBifJyL49YU61mcafud7J9XmBmLiGuDwdxUfymDJpRvz
         9w1rk/Mgpp7LxZ5ZFIj9mlhkgYM6TVZGNfEQt5mcQ93XzDwrSMXnWFLTdRWrnLKidgI6
         4u9wBY6svWwAOlGo/+djYIySA4MP/MWad+r/PA+FeUJTYTeQT0GvoPV5hQfr/4CHMpca
         ED9uZw5U+HdwaKrljSug+qPiTaCc6n/gPL7pFdyB+wFOxFLkmslmv/6UNgPXL5F1l6Oq
         KHtQ==
X-Gm-Message-State: AOAM532IHRKHAlV4HhEYhdaDZQjN2bJx2JLL6eeP00PxINCYG3Rjd/+l
        8wsQg8kuGQkR+qYEZMNrLlnfiZ87p8DdHFoSWS0=
X-Google-Smtp-Source: ABdhPJzpCRnfySNQFvTEtSlbK4QjS1EMfT1NUW6C8Bp4EhR81e00L8n+jQEHSL7hnutTyqRWS/yxiIS5EIyhpsFFt8Y=
X-Received: by 2002:ac8:4e8c:0:b0:2de:a2f9:15cb with SMTP id
 12-20020ac84e8c000000b002dea2f915cbmr21593642qtp.385.1646182543294; Tue, 01
 Mar 2022 16:55:43 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ac8:58c3:0:0:0:0:0 with HTTP; Tue, 1 Mar 2022 16:55:42 -0800 (PST)
Reply-To: mrslovethkonnia5@gmail.com
From:   "Mrs.Loveth Konnia" <deni6513aw@gmail.com>
Date:   Wed, 2 Mar 2022 00:55:42 +0000
Message-ID: <CANOq_xZytac_wbnXwcVfeh4o86BLrHWMi9A3=nW0frTEmGMnkg@mail.gmail.com>
Subject: Helloo
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:82c listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4005]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mrslovethkonnia5[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [deni6513aw[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.6 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Poslal jsem v=C3=A1m dopis na v=C3=A1=C5=A1 mail, ale nedostal jsem od v=C3=
=A1s =C5=BE=C3=A1dnou
odpov=C4=9B=C4=8F. Dostal jsi m=C5=AFj p=C5=99edchoz=C3=AD mail
.......................................
I sent a letter to your mail but got no reply  from you. Did you
receive my previous mail

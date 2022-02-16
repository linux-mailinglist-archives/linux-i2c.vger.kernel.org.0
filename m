Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21E9D4B868B
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Feb 2022 12:19:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231388AbiBPLTz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 16 Feb 2022 06:19:55 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:59138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbiBPLTz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 16 Feb 2022 06:19:55 -0500
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com [IPv6:2607:f8b0:4864:20::c43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3839BF41
        for <linux-i2c@vger.kernel.org>; Wed, 16 Feb 2022 03:19:43 -0800 (PST)
Received: by mail-oo1-xc43.google.com with SMTP id e19-20020a4ab993000000b0031a98fe3a9dso1458148oop.6
        for <linux-i2c@vger.kernel.org>; Wed, 16 Feb 2022 03:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to;
        bh=y/WwzOufdV8bFjC2XhKxeIddPBCZMNKZVHLfMOMvj6I=;
        b=Xx/gYixp2kwKF9egh8TDvk1y1p4tTmEa5X1oxbDOu3/odXRRwGsRsdB4w6jfHn1o4H
         8G0M9oSgWO/GuJN8uNu/mHDcvtRCRaz8pDdajJz/boGo/bWT4YO7e+9lRnJTPk1hRb6H
         LWfKdiSvEglXbstxuqKJldjxJM8MXIvYwwT0HUmfe1FBZt0dZSVsvhnBHpWXmSAshki6
         hyobDz9KOR22KHly5MuEx6opuSi2evfqdqAOGPd9SYaj/cYIrtTdApAE/kUq+vIZcwGg
         uwbZsra7C5pEBXb4Tl0m7QvKE1H6wF7Xplo45IHrFFpNj9LjNB6leSyIx25glzCj9XJc
         QH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to;
        bh=y/WwzOufdV8bFjC2XhKxeIddPBCZMNKZVHLfMOMvj6I=;
        b=zvKIDSDItBnL1qHR3CPeckx6Ri3n5Rh2exG8adPK8Giv9fiBFw3KTwMqLfdg9Zy//S
         6cjbBvBGASoG6F9cV7q8mq+yOIoGmranoWfwfKd136sKZe482bQRjjAQ2Y8691DX6Q8T
         AzLHVxyRQDH4nLeb5Sz6h2MjVNlqDIGcBsNO4/WTfwk75QEMWt0nQ65hl0SRuIECrf6d
         ya4doLPT2sVakzIZXx6vYAOum8iGc1IUOZOQxhSbY/q7vUFRJ6WdFopmMI2pj63RxCZa
         4+Vx4S4dbKPN7Fw/h27qYFLM1R7irMWjzVyxvJmXVJrmZPRbkHeGy1ePAzoYeT0DKg38
         vqQQ==
X-Gm-Message-State: AOAM533kqDttSxOxtsqDIlZyT0gDKQT13G3lWob8Sq5VoLZVEfmAFHcn
        3YR40FlUHN8xEUjlsbSwiP7iiS1bmzWv6imhrj8=
X-Google-Smtp-Source: ABdhPJx0QVI2C5bWODgIDb5PfTvrV43SkuxpoVlFi3wGeoZTjYu/sAJyK4db32ocwnTU6y9sWxgS3jEDnWG6+OLivyU=
X-Received: by 2002:a05:6870:2a41:b0:d3:473b:3e96 with SMTP id
 jd1-20020a0568702a4100b000d3473b3e96mr278939oab.38.1645010383049; Wed, 16 Feb
 2022 03:19:43 -0800 (PST)
MIME-Version: 1.0
Reply-To: drtracywilliams89@gmail.com
Sender: atminstruction@gmail.com
Received: by 2002:a9d:2ae4:0:0:0:0:0 with HTTP; Wed, 16 Feb 2022 03:19:42
 -0800 (PST)
From:   "Dr. Tracy Williams" <tracy0wiliams@gmail.com>
Date:   Wed, 16 Feb 2022 03:19:42 -0800
X-Google-Sender-Auth: vU6KKat7LNNlDJdvGSMs--gFupM
Message-ID: <CAGNbUyGuuvehSKJX=PMgzS4=4HFekWKysE86mE5mVHae5H+NWA@mail.gmail.com>
Subject: From Dr. Tracy Williams.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:c43 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4488]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [drtracywilliams89[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [atminstruction[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.5 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Dear,

how are you today,I hope you are doing great. It is my great pleasure
to contact you,I want to make a new and special friend,I hope you
don't mind. My name is Tracy Williams

from the United States, Am a french and English nationality. I will
give you pictures and more details about my self as soon as i hear
from you in my email account bellow,
Here is my email address; drtracywilliams89@gmail.com


Please send your reply to my PRIVATE  mail box.
Thanks,

Tracy Williams.

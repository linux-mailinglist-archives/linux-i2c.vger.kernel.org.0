Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2B9E5A7ECB
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Aug 2022 15:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbiHaNbu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Aug 2022 09:31:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231214AbiHaNbt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 31 Aug 2022 09:31:49 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65DDDCCD79
        for <linux-i2c@vger.kernel.org>; Wed, 31 Aug 2022 06:31:48 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id y3so28423889ejc.1
        for <linux-i2c@vger.kernel.org>; Wed, 31 Aug 2022 06:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc;
        bh=s7NlDumETs9wQ3Y95JXvaCOT89PMenrVizz0Vrnaec4=;
        b=egysWk4rXPop7Z+R0i4NjLsUoXTeLn805ISgwqoS4srRAqD1IW7IvBtax/mq+G+nmv
         pi+q+9qzxjs9NrOfj0z4mWrHgDBMDZ9Lhfp/hkJjeI9HsbjAMmpuBOn7qN9yEU2gJ8T4
         3AAmo76vFlyQFHMgstxyixRftnY2oqnRGR7Oz6VZKtUGq/ZNZ6KANCNvtuvWdnBFtTwj
         y1QefrO0S5U5Nf6TpU80ve0hWN8yuxnYN5vcmeKF9otrZG0u7lUp9AM64Zj5XKPHomyw
         L7uBZOH+GAGbI0hWSFLTDJa+yd+bx7DlwrHe0vsbU4mRehSY3p5r6gxPvKALtsrL6R0J
         wsoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc;
        bh=s7NlDumETs9wQ3Y95JXvaCOT89PMenrVizz0Vrnaec4=;
        b=7kdiQ6HvZhmGvKqicMiUv5bBMtBJOxtlrUykRvWHEf4jJFZgkT0CaZ70gzDYnoZ1WV
         ZVRq7Fg83RiHX3UGBOWUC2pwBPoOd5OToXAXynXc/OoYTH5DgPp6maKXE6lzARBJYITl
         oy5l9hcFJtr67mpHWMORdQ7Kbd7y4o8mOCevFQGzDcBsm5FVSv1F5UJf3SoVQlPfld9L
         8NLKn2h3rHrZVEwVrB1LHey80d34o8IsSt/+qeARhcvgUCiShk+2GLUx4mwXWqLdUGHU
         wCx+mmUOjldBkecBRY3d0tUsy86u0C0iYIYXfY5ww94ckEOGAONOxe2NN+ejcjvPoVA9
         Qw/Q==
X-Gm-Message-State: ACgBeo0aEW3Wou/th5alh6WD3wfk3m5sHdu7iTZF2AYytUgngK5wTzUb
        7emnVxeyAcyIMbU2ReAqXpOq+4Vf4Ave0brts/8=
X-Google-Smtp-Source: AA6agR56eZ1hQMOPEJqI369B/oYOtqCx+SrhUTxhYbYP6boStGz9t5+alE4gJe0PeVE51RNxRfNOqLlprOrsPyLrPv0=
X-Received: by 2002:a17:907:31c1:b0:742:28a3:5d08 with SMTP id
 xf1-20020a17090731c100b0074228a35d08mr6022355ejb.112.1661952706738; Wed, 31
 Aug 2022 06:31:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6400:5590:0:0:0:0 with HTTP; Wed, 31 Aug 2022 06:31:46
 -0700 (PDT)
Reply-To: golsonfinancial@gmail.com
From:   OLSON FINANCIAL <isahadam0793@gmail.com>
Date:   Wed, 31 Aug 2022 06:31:46 -0700
Message-ID: <CAO-ejdphBdoypkdQC15K-W3YDUfECzWjNoHeC6E6ymSVyp3CBA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:642 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [isahadam0793[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [isahadam0793[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

--=20
Hallo Gr=C3=BC=C3=9Fe,
Ben=C3=B6tigen Sie dringend einen Kredit, um ein Haus oder ein Auto zu
kaufen? oder ben=C3=B6tigen Sie ein Gesch=C3=A4fts- oder Privatdarlehen, um=
 zu
investieren? ein neues Gesch=C3=A4ft er=C3=B6ffnen, Rechnungen bezahlen? Un=
d
zahlen Sie uns Installationen zur=C3=BCck? Wir sind ein zertifiziertes
Finanzunternehmen. Wir bieten Privatpersonen und Unternehmen Kredite
an. Wir bieten zuverl=C3=A4ssige Kredite zu einem sehr niedrigen Zinssatz
von 2 %. F=C3=BCr weitere Informationen
mailen Sie uns an: golsonfinancial@gmail.com......

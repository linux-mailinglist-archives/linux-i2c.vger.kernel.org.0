Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BDC553AB63
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Jun 2022 18:56:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353924AbiFAQ4D (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Jun 2022 12:56:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354092AbiFAQz4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 1 Jun 2022 12:55:56 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE839A26EE
        for <linux-i2c@vger.kernel.org>; Wed,  1 Jun 2022 09:55:54 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id jx22so4958351ejb.12
        for <linux-i2c@vger.kernel.org>; Wed, 01 Jun 2022 09:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=XGUcPAyFYtUWMYO5tKtj4ZzzebuC3OQHKF+J/C0blWA=;
        b=GQxwoPw23GqJlE6gUn46MyEfP7JNh6wCkSEKxcSX7K1ddZyD+BpZYSvwvX0ROjwxVU
         OgDqpHNfBl4dTNoDphNPYHM1OWm1+R4gkxB2lvhnYEopNzlDsKLfSaA175A+wQMME484
         7/Zv5PDmqKgNcdspwx7c/jPrbdb0QNnjJJ2lIUV0DFigZKq1gyaiHirVqWyAasVhxDqV
         aLo6sGGfPZidfBrsFcgrG+KfvU8cRjCJsJcqblN6iEk1Zc7FnOvea67QupRS5K4hVZ/6
         vCUACks2r1U7Oan/N7igIcnj2S+ezN6f3Z3Rj0g6XQEBUstGhb9i7hEsZG44CP6gYtyb
         wYhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=XGUcPAyFYtUWMYO5tKtj4ZzzebuC3OQHKF+J/C0blWA=;
        b=Op5do5Tv9jEKliytdpl8FnzHiIs3/zsrF2+elWC0C0Or03y1xYZAGa6yW+hVBRmhH0
         +ee9h8oQ4nPJt+bKYkikMxwTyb7Zp0J5fPVGJaBCnuimcFLM6sc9HiEr5no/UfkyEKGu
         PyD7r1bdGeL5d6x/NPEIOr0iP+ZWpMLZTi/GtLLOnatVtoVYZTLTfpYrNexkyk1btueJ
         iCvBlZTIe7sAb8eJR3ibuTDKN+VjKsVigk0V8FQhRIdQbUp1g380/57XaHraMed+ByGR
         hOlUue6xDpWhWQALliNf6PP+UEULXNZod4VywVc3pumjJUfkCcZnQ0pn+LYY6hnxu8l6
         Jyjw==
X-Gm-Message-State: AOAM530DtRWjgv+m7p1fne0Ok26UdH+0AT3IPqnFxGyCDb+F9d6jfxor
        lsqsHVhcMkCoYSjy2GuPro2YpOIe9XyyUhlohb0=
X-Google-Smtp-Source: ABdhPJxc1GdwAK56TDkqosW+LQcUI30GsRqjxNdMT9/gujLqWQw3ua0bZQLTFwjQEwAZNsNcJZsuhAaWDilS6rTfcMo=
X-Received: by 2002:a17:907:3e0e:b0:6fe:b42f:db81 with SMTP id
 hp14-20020a1709073e0e00b006feb42fdb81mr442536ejc.516.1654102553356; Wed, 01
 Jun 2022 09:55:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab4:aa84:0:0:0:0:0 with HTTP; Wed, 1 Jun 2022 09:55:52 -0700 (PDT)
Reply-To: isabeljffrsn@gmail.com
From:   Isabela Jeferson <adamfat44@gmail.com>
Date:   Wed, 1 Jun 2022 18:55:52 +0200
Message-ID: <CAP63eHiVRyoZPsM23Cj+pmThXpvZThJstQ=SMF3Mo7q+EVGkqA@mail.gmail.com>
Subject: HELLO.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,HK_RANDOM_REPLYTO,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:632 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5052]
        *  1.0 HK_RANDOM_REPLYTO Reply-To username looks random
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [adamfat44[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [adamfat44[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

-- 
How are you today? I hope everything is alright?

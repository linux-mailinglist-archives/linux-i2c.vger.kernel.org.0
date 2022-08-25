Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A063B5A0D81
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Aug 2022 12:07:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236812AbiHYKHw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Aug 2022 06:07:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236657AbiHYKHw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 Aug 2022 06:07:52 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CD39A7AB5
        for <linux-i2c@vger.kernel.org>; Thu, 25 Aug 2022 03:07:51 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-11cb3c811d9so22592265fac.1
        for <linux-i2c@vger.kernel.org>; Thu, 25 Aug 2022 03:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=NcQgfGWmNtGVcmYOkqhvmNWuEth66CXwSKmPdJfqqgM=;
        b=ce99SHNkrhAp88xTDZRgZuB+dNWFxl+WB5g8g5G8Pp3LNkIer9du+KLdl6o9AmENrx
         UD/ZR8yR2ZqclQUlwwrwYzocv21Pv1N5D+TtzQ8d0xQvZVSo1SxYiN2v0qh+Rsv72N3D
         anfJmfgedMYwVUuz2dR0a3LaJly3Pp/WrxVCRXZAEI0JJVrlD5IfiW44NEM/QowkgObj
         Hvo5+UQviCjJcm81Wbem95kMsP6kW32e7Ox/p2XkU2CCBYghMeg1o5UKmF+IoGs2s/bk
         8xnDDee7itSSFjEUGVlkmRtoTja6gkYve8upzi6c8evyUmQaCRGYoOu00iLUFuPf7AkU
         D6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=NcQgfGWmNtGVcmYOkqhvmNWuEth66CXwSKmPdJfqqgM=;
        b=5e2qoLChgCnmF1qISl4NvczJ2OUSidS43We2FJq3OKzuhe1IVu0lWymxoyWGvVqNz2
         1mSLVw3F36tl0HfEP+k++h98+kC3Ig7fgTcFweAlkbJi1QYD6wqy6rxVIo38xAMUWd/d
         pIQVzAAuE1m5LYVWw8ta/kY5z2p6eBlqriIHbQgoBZn9e7Pg8SmpmCq7FWDxvaf+sfCS
         pUJWsafIdFJHrQBOreU+hKTMKnMs3yrp+fy12NzsDDIVbTdLCe+WhhsQWCLlGwcPTk8n
         8QaXd3aH7IhgNh8zP+jUh2cwLob83Rec2/avT+U9BgjTKfXva7+ufsBV6N5PoE9wQiHO
         zlsg==
X-Gm-Message-State: ACgBeo0iB9QxZZmoZBAfB7X8sDR08m3mZCu0jP6qqrmkFCY3xMUEoNBT
        rjjGrSLejHH5dwI112xaSv3yJFja/EPJtOH+gKw=
X-Google-Smtp-Source: AA6agR6ZiYrlm8rl0PFTEF7/Ywi+ToQLNhXcr5mlqJMSqR3k4PU8cWsxi3AH3AFMIX3SueV0vm/lBhhKrRtBRHGo9ko=
X-Received: by 2002:a05:6870:b51f:b0:11e:39c8:cc10 with SMTP id
 v31-20020a056870b51f00b0011e39c8cc10mr264645oap.184.1661422070619; Thu, 25
 Aug 2022 03:07:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:5ec3:0:0:0:0:0 with HTTP; Thu, 25 Aug 2022 03:07:50
 -0700 (PDT)
Reply-To: sgtkaylla202@gmail.com
From:   kayla manthey <tadjokes@gmail.com>
Date:   Thu, 25 Aug 2022 10:07:50 +0000
Message-ID: <CAHi6=KauV8pv-oO+4kczWCD9mce10r1mcEer91vv6NGp-Yv=eQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2001:4860:4864:20:0:0:0:35 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4996]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [tadjokes[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [sgtkaylla202[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
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

Bok draga, mogu li razgovarati s tobom, molim te?

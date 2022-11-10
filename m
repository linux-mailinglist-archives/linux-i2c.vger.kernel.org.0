Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54142623ED5
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Nov 2022 10:42:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229495AbiKJJmn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Nov 2022 04:42:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbiKJJmm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Nov 2022 04:42:42 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9193926EA
        for <linux-i2c@vger.kernel.org>; Thu, 10 Nov 2022 01:42:41 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id io19so992238plb.8
        for <linux-i2c@vger.kernel.org>; Thu, 10 Nov 2022 01:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/htPiokpxlSzvGlhsl1Xj6H5P5GA8oJZklSjRGzFbNU=;
        b=XjdXtaSK5s/7D9FH+toZO2ijN14GfQX1dLscjPMO8AqbFls34uR4G+iszwizNCO0sw
         TwzBuAXDpwj7UXn605r7YIXF1+QsHQZGWfZU8A8967S33j07D7hOntOh7L+prgIv2K6n
         IiRzefs3SzV1jo4O/56YJze/vhnhKWkYBq0GA+KgNuMVCldjpIikSEA7hoGkrJ3Evpjh
         9ZXNRK9w3IcKUgqiri7+ikJsW068D38STgjrMZpz983Nc3N7rIpKW7KF/IiXjU0B47Ht
         fXQETZdB9gGNywNq/wt4LWnVOeCrCe7TIR3TAF6h3LxIm6lbMeyzsWeNznBVVvKTjhuT
         oC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/htPiokpxlSzvGlhsl1Xj6H5P5GA8oJZklSjRGzFbNU=;
        b=5X16vBEETC+te7XMBdJiL+v/DOuLrRPm8kWiW5XWZ9L+wM7s6G7mDIy4FYo3MDj8lu
         rVQRDUcSQfO5Pa4iKFS6IkPl8dRqyBPSoJjf+ZjZu36An3CHY43pwQg0wjPokwUrqIfk
         u95X9zclo431bWHUn2v4S4XzDaz0e6HjbZtlGbbigDZkYI+1b/9813r+6JZze12wTU4L
         EjlqgdMXQR/J4gOOGfZy+WyiWX8s9wrn5OJN4pH3r6K3O16dnJQiDIHTImf54ZejLejd
         +4k8k4OP8zqPT1S5gLBDzRmBIuoiJlznoK6yjexExU7/WyGAXFxkdJiaz4Vv0oGrmtOB
         83Jw==
X-Gm-Message-State: ACrzQf36Ps12mdon2JYjPgDE6V46stz0FdiTGvlQDxuV/95SVMaIDrnV
        u6sS34D5LF815nMHPmQ4/O+D19GMI5WXqH3GKLM=
X-Google-Smtp-Source: AMsMyM5g5oSkKqCPDCAkHyIUVgR7vf09CzPcQ+9SXZ5h/tjyPpIBGkrUkTtbQuwqr2omqw9GPWPnUtrnXbUetw/UeYA=
X-Received: by 2002:a17:90a:d396:b0:214:2cff:fbb6 with SMTP id
 q22-20020a17090ad39600b002142cfffbb6mr42134922pju.224.1668073361101; Thu, 10
 Nov 2022 01:42:41 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:522:c816:b0:497:5791:afb9 with HTTP; Thu, 10 Nov 2022
 01:42:40 -0800 (PST)
Reply-To: davidnelson7702626@gmail.com
From:   mark odu <meles8888@gmail.com>
Date:   Thu, 10 Nov 2022 10:42:40 +0100
Message-ID: <CA++r-0xWCA713ou6e01UcbAtoz6+h8wACF2ZA=aMri5uKuB5OA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:644 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5030]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [davidnelson7702626[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [meles8888[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [meles8888[at]gmail.com]
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  3.0 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello friend, I want to send money to you to enable me invest in your
country get back to me if you are interested

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3E7A699872
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Feb 2023 16:10:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbjBPPKZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Feb 2023 10:10:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbjBPPKY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Feb 2023 10:10:24 -0500
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE5D41B31F;
        Thu, 16 Feb 2023 07:10:23 -0800 (PST)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1pSftt-0006pU-46; Thu, 16 Feb 2023 16:10:21 +0100
Message-ID: <cbdc682f-87a6-3885-5853-328562569bdd@leemhuis.info>
Date:   Thu, 16 Feb 2023 16:10:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: =?UTF-8?Q?Re=3a_=5bRegression=5d_Bug=c2=a0216913_-_i2c_not_working_?=
 =?UTF-8?Q?after_hibernation_=28i2c=5fdesignware=29?=
Content-Language: en-US, de-DE
From:   "Linux regression tracking #update (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Georg <g.wenzel@gmail.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
          Linux regressions mailing list 
          <regressions@lists.linux.dev>
References: <8c3fd22a-9a11-216c-891f-969475745d20@leemhuis.info>
In-Reply-To: <8c3fd22a-9a11-216c-891f-969475745d20@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1676560223;c5104e7a;
X-HE-SMSGID: 1pSftt-0006pU-46
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 12.01.23 13:51, Linux kernel regression tracking (Thorsten Leemhuis)
wrote:
> Hi, this is your Linux kernel regression tracker.
> 
> I noticed a regression report in bugzilla.kernel.org that sounds a lot
> like it's a regression (it's not totally clear). As many (most?) kernel
> developer don't keep an eye on it, I decided to forward it by mail.
> Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=216913 :
>
> [...]
> 
> #regzbot introduced: v6.0..v6.1
> https://bugzilla.kernel.org/show_bug.cgi?id=216913
> #regzbot title: i2c: i2c_designware: i2c not working after hibernation
> #regzbot ignore-activity

According to https://bugzilla.kernel.org/show_bug.cgi?id=216913#c7 :

#regzbot fixed: 75507a319876a
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.



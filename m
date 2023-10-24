Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 961A17D5C8B
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Oct 2023 22:37:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234934AbjJXUh2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Oct 2023 16:37:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234576AbjJXUh2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Oct 2023 16:37:28 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D5D6EA;
        Tue, 24 Oct 2023 13:37:26 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DB6AC433C8;
        Tue, 24 Oct 2023 20:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698179846;
        bh=x7ktYcUkMNtPmHlHAYqJ+4Z7/N2PKnK+TRSa4Xb7n3M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dWNQNuaYvlSc3NTRCuoHcnwQ/eWqsLl3FW43KutTC9zOxYR5ODKuH4KGr57SwcFeJ
         hzULR4rYgraQ+CtwFsbBFvLzgLydTX5Eidvje08Fjb3cDFeCMJRfdMyEuVgTtktShV
         4/SMKe/28TnRflu4xZXySy71eygJpKbaSuiNunZ0AMN0JCB0fj036485xfapYfle0S
         JFYw2w9bwLn1InCnKXIp1U/QpV9nga2bf1c1wWbYC0spjVRk8jW123PCD7NJWuRW2x
         gVIVqKprj61qz9szutCcHR1dhrwWGNJ1xzu6EfHhhXc+6lk/VXNsyKjJ/wlYUE3i40
         PGnV/OMXtoEuA==
Date:   Tue, 24 Oct 2023 22:37:19 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc:     "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] i2c: mv64xxx: add an optional reset-gpios property
Message-ID: <20231024203719.bbk7g4q7e4mzar36@zenone.zhora.eu>
References: <20231018210805.1569987-1-chris.packham@alliedtelesis.co.nz>
 <20231018210805.1569987-3-chris.packham@alliedtelesis.co.nz>
 <20231024191801.kofb6cbczswp7xxn@zenone.zhora.eu>
 <4b548124-d1d5-4746-a5bd-03757013282d@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b548124-d1d5-4746-a5bd-03757013282d@alliedtelesis.co.nz>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Chris,

> > as you are working on the v4...
> >
> > ...
> >
> >> +	if (drv_data->reset_gpio) {
> >> +		usleep_range(reset_duration, reset_duration + 10);
> > I'm not against this, but it's not optimal unless we know more or
> > less what to expect from reset_duration.
> >
> > Do we have a rough idea of what reset_duration is? If we don't
> > then you could consider using a generic "fsleep(reset_duration);"
> > Would it work?
> flseep() would work for me. All of the devices I'm testing with seem to 
> be fine with a very short reset pulse, they'd probably be fine with no 
> delay at all.

you know this better than me :-)
If you say that a delay is not necessary, then I'm also fine.

In any case, we are in probe and I don't think it's time
critical, so that a little delay wouldn't hurt and make everyone
happy.

Either way I'm fine as long as you use the correct sleeping
function.

Andi

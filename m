Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12FE1738093
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Jun 2023 13:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231150AbjFUKMP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Jun 2023 06:12:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232406AbjFUKLt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Jun 2023 06:11:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80ACA1A8;
        Wed, 21 Jun 2023 03:11:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 09DF3614E9;
        Wed, 21 Jun 2023 10:11:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA212C433C8;
        Wed, 21 Jun 2023 10:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687342270;
        bh=kDhwZHWNXcw1IwSLHkmp6O3zBwaHtkYg+UZ/MaIzi5o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qC1dVY+p3NErHn37p9wFcESVrSQiCTdSO6AWnQCmc/xHWCFVz1b7xDGWSWjnT6Zjg
         W5d+guFqN9ONW0E2pe+WSPOPwt4DseZlVJ/BIY5oul8F9Y/2aspGNIIXDL1W+fyMZC
         LKziFfEnJyjVOSn5222UUX5nNHzRWZHqDb6R6Xr+bxMFTpNi/Kn50d3xN1z/U2Dlv+
         wmszTI1RAukatdMetCTtPUYurs/s6Px3o0aad55zyKHfBdRSOh8t5Hhf3bFD1vbY7r
         IYcoRQVWK0un6ONwTGAODrtKMyG9DCK9cmpoQWDi53ZYug+0XPbIny76ZMZV1hOe+c
         qFW+VMV0mMnQg==
Date:   Wed, 21 Jun 2023 12:11:06 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] GPIO-based hotplug i2c bus
Message-ID: <20230621101106.uafxsloorksnjmy3@intel.intel>
References: <20230619153732.46258-1-clamor95@gmail.com>
 <30c50635-ff42-3a85-a419-673ca6d0422e@linaro.org>
 <CAPVz0n1fo7EjAC-UUVawQoeP4AhwRWAg1MZyremNDHFdta+Reg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n1fo7EjAC-UUVawQoeP4AhwRWAg1MZyremNDHFdta+Reg@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Svyatoslav,

On Mon, Jun 19, 2023 at 06:52:50PM +0300, Svyatoslav Ryhel wrote:
> пн, 19 черв. 2023 р. о 18:49 Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> пише:
> >
> > On 19/06/2023 17:37, Svyatoslav Ryhel wrote:
> > > ASUS Transformers require this driver for proper work with their dock.
> > > Dock is controlled by EC and its presence is detected by a GPIO.
> > >
> > > ---
> > > Changes in v2:
> > > - adjusted documentation
> >
> > This is too generic. Everything can be adjustment. Be precise what you
> > did here. What changed?
> >
> 
> Everything that you asked for.

please list all the changes you made trying to be as more
specific as you can.

You make life to reviewers easier.

Thanks,
Andi

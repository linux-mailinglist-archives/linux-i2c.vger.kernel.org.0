Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3642C759EAA
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jul 2023 21:33:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbjGSTcw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jul 2023 15:32:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230377AbjGSTcu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Jul 2023 15:32:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D8791FDC;
        Wed, 19 Jul 2023 12:32:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7C91B61803;
        Wed, 19 Jul 2023 19:32:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD1ADC433C8;
        Wed, 19 Jul 2023 19:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689795163;
        bh=N9sUbulAgUXtPlmw8jl5xfdENe0VOW/VEmTuoJuKFSI=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=vK2R7sJ1r5AdtAq+fy57hZlOKY42M5ez2S+WXgkAcMpK6/ONEVdrUCtbbDPok4LLT
         L3GiSo0y36fcYsUrlw9q2PJ8obyRn+7YbIj9QTohihfvCR1hO1Epd+SdFOWP3a1S+S
         rd+j6An9ov8qg53B+fydb/2c7f8NRMQi9iYtwAAWVPHdlVPmvSnlZny7UuvYb3wDe+
         ByfFOEfRxok2kVhnqpSv3yeXgVheZtTqsuoClBCqgDpAEvNUnmJPI3pIdGTcbOauVQ
         D7KIu4N+r2EPG4MYel8ZFLwk5mpPEG/UoTfD4G2S7/4gzlcry8PXp2EyCdjWExZUgw
         cyO4zdmC/mzHw==
Received: by pali.im (Postfix)
        id 393ED7CA; Wed, 19 Jul 2023 21:32:41 +0200 (CEST)
Date:   Wed, 19 Jul 2023 21:32:41 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Wolfram Sang <wsa@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
        Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, Dell.Client.Kernel@dell.com
Subject: Re: Accelerometer lis3lv02d is present on SMBus but its address is
 unknown, skipping registration
Message-ID: <20230719193241.l7ihqtwok5sywrx5@pali>
References: <97708c11-ac85-fb62-2c8e-d37739ca826f@molgen.mpg.de>
 <Y/0EIRsycj8EWjrz@ninjato>
 <47ed190e-ebae-fdc6-f46a-f42a36fb6f26@molgen.mpg.de>
 <Y/3cYL0s1Ul9fgR+@ninjato>
 <1669a3d8-1d19-e91b-8f6e-36f5037fff47@molgen.mpg.de>
 <Y/3e0JsMmX6hlNHI@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/3e0JsMmX6hlNHI@ninjato>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tuesday 28 February 2023 12:00:32 Wolfram Sang wrote:
> Hi Paul,
> 
> 
> > It does. After your command, Linux logs:
> 
> Cool!
> 
> > I can cook up a patch, if you want.
> 
> Yes, please.
> 
> Happy hacking,
> 
>    Wolfram
> 

Hello! When you find some time, please send a patch. If needed I can help with it.

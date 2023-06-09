Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05E6772A553
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Jun 2023 23:26:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231195AbjFIVZ6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Jun 2023 17:25:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230384AbjFIVZ5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Jun 2023 17:25:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36FF035BE;
        Fri,  9 Jun 2023 14:25:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BF77A65C49;
        Fri,  9 Jun 2023 21:25:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84FE8C433D2;
        Fri,  9 Jun 2023 21:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686345956;
        bh=JVAjdjvrTxxiymc4a2YVsvJs2eE8Ly4rWtiHbk2Ggbs=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=JVkgPVEE2//Lx9LkbNdhDbCvFNV086ZinRn5yn5KPywgGF/ue0rL3AnPvhAZQ+Lks
         ocEkioYIj6O9NTfcekF3emWNLy/YQgbSIDlZnqRdWHMmXG3qRrHEO32/YN5ifv1WqH
         tjIHgapck7gidndmenjbtrMEPw+GfZFNb0ZhPowFPdgU47Wu/Qb+nvATLxh30TlZFx
         WeOoz3Rds9dR5o3eQO7154en6+XndyR/u1OVlBjckH//nV5PscR2ABkRHsLV7cuNBd
         09xqbIxZXV7z2hSieqFgNO1ue+XJxng8nNirMGL8DOyT05lGLGtForb77hjGau+poe
         ncj1XtsL10FDg==
Date:   Fri, 9 Jun 2023 23:25:52 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     "wsa@kernel.org" <wsa@kernel.org>,
        Robert Hancock <robert.hancock@calian.com>,
        "michal.simek@amd.com" <michal.simek@amd.com>,
        "shubhraj@xilinx.com" <shubhraj@xilinx.com>,
        "marex@denx.de" <marex@denx.de>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: xiic: Don't try to handle more interrupt events
 after error
Message-ID: <20230609212552.5o6aopv7iicej3kn@intel.intel>
References: <20230606182558.1301413-1-robert.hancock@calian.com>
 <20230606192453.zjzz4kt76kus5hr5@intel.intel>
 <c763371c710c9952154496026610e2ff583c173a.camel@calian.com>
 <20230606212053.bwpoxyost4fkpati@intel.intel>
 <ZINGGmRLYEQ+NfkI@shikoro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZINGGmRLYEQ+NfkI@shikoro>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Fri, Jun 09, 2023 at 05:32:42PM +0200, wsa@kernel.org wrote:
> 
> > I think the patch is correct and I will ack it:
> > 
> > Acked-by: Andi Shyti <andi.shyti@kernel.org> 
> > 
> > I think, though, that this needs a proper fix and testing, in
> > order to cover all the possible combinations. The scenario you
> > highlighted is indeed one, but not only, potential situation that
> > could arise.
> > 
> > Can I just ask you to write a bit more in the comment to 
> > highlight the possible failure?
> 
> I tend to apply it to for-current because it improves the situation.
> Further improvements could be made incrementally? D'accord everyone?
> 

OK with that!

Thanks,
Andi

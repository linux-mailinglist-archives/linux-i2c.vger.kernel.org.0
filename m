Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 586A46F4FD9
	for <lists+linux-i2c@lfdr.de>; Wed,  3 May 2023 08:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbjECGDo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 May 2023 02:03:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjECGDn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 3 May 2023 02:03:43 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2CCAD2680;
        Tue,  2 May 2023 23:03:43 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 7A5B880EB;
        Wed,  3 May 2023 06:03:42 +0000 (UTC)
Date:   Wed, 3 May 2023 09:03:41 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Reid Tonking <reidt@ti.com>
Cc:     "Raghavendra, Vignesh" <vigneshr@ti.com>, aaro.koskinen@iki.fi,
        jmkrzyszt@gmail.com, linux-omap@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] i2c: omap: Fix standard mode false ACK readings
Message-ID: <20230503060341.GL14287@atomide.com>
References: <20230426194956.689756-1-reidt@ti.com>
 <445b3cbf-ffbc-6f77-47db-c30fc599e88f@ti.com>
 <20230428074330.GJ14287@atomide.com>
 <20230428183037.wbhds54dz5l4v5xa@reidt-t5600.dhcp.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230428183037.wbhds54dz5l4v5xa@reidt-t5600.dhcp.ti.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

* Reid Tonking <reidt@ti.com> [230428 18:30]:
> On 10:43-20230428, Tony Lindgren wrote:
> > * Raghavendra, Vignesh <vigneshr@ti.com> [230427 13:18]:
> > > On 4/27/2023 1:19 AM, Reid Tonking wrote:
> > > > Using standard mode, rare false ACK responses were appearing with
> > > > i2cdetect tool. This was happening due to NACK interrupt triggering
> > > > ISR thread before register access interrupt was ready. Removing the
> > > > NACK interrupt's ability to trigger ISR thread lets register access
> > > > ready interrupt do this instead.
> > 
> > So is it safe to leave NACK interrupt unhandled until we get the next
> > interrupt, does the ARDY always trigger after hitting this?
> > 
> > Regards,
> > 
> > Tony
> 
> Yep, the ARDY always gets set after a new command when register access is ready so there's no need for NACK interrupt to control this. 

OK thanks, looks good to me:

Reviewed-by: Tony Lindgren <tony@atomide.com>

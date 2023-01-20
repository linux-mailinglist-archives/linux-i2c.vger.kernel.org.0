Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92810675FDC
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jan 2023 23:00:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229828AbjATWAb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Jan 2023 17:00:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbjATWAa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Jan 2023 17:00:30 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA28F81988;
        Fri, 20 Jan 2023 14:00:28 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 49360B82A89;
        Fri, 20 Jan 2023 22:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71090C4339B;
        Fri, 20 Jan 2023 22:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674252026;
        bh=By4+wnFOmO9TMaanbIqfOWU4AfMzOHH61k0H3Sw32qM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MgwgAR3zHuMa9eD2fpqe8ruSNglll1MsLtSdaqDKlSSmSf6kUgaOu3fVXBXmHzhVA
         4O9bIdGAHYqttTBF4hNbUopWqXumnxKvX7KrEuWJiSrDmrIAp/xQ7r1ofJCYuaVaxI
         0mye2Q8DS87TjietT9qC7TsKC/L1j5utNy4i0I3LbSIMQML6Fh++CjzKwPWVn/oMV+
         RjEV4UJtlCJSZL+lqgfBB8jARpvFTUxZeuVTDOSXB5kQ+dY5n6dL6ov1xI7NAoyleX
         AuU2UG7D6x5lj6D83kYnlOb3kOOrx3w+6OOFeskPml5F14JvZBZ2ds9BpV5qz59T8M
         WzFbqlYIzivWg==
Date:   Fri, 20 Jan 2023 22:00:23 +0000
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Angel Iglesias <ang.iglesiasg@gmail.com>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Grant Likely <grant.likely@linaro.org>,
        Peter Huewe <peterhuewe@gmx.de>,
        Lee Jones <lee.jones@linaro.org>,
        linux-integrity@vger.kernel.org
Subject: Re: [PATCH 001/606] tpm: st33zp24: Convert to Convert to i2c's
 .probe_new()
Message-ID: <Y8sO93QxH+lUPBtf@kernel.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-2-uwe@kleine-koenig.org>
 <20221216090904.qlekgvtpriijmvay@pengutronix.de>
 <Y696MSvhEUWlHSoK@kernel.org>
 <20230106175617.d3tlyb4lfdv34pvw@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230106175617.d3tlyb4lfdv34pvw@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jan 06, 2023 at 06:56:17PM +0100, Uwe Kleine-König wrote:
> Hello Jarkko,
> 
> On Fri, Dec 30, 2022 at 11:54:25PM +0000, Jarkko Sakkinen wrote:
> > I picked it now.
> > 
> > BR, Jarkko
> > 
> > On Fri, Dec 16, 2022 at 10:09:04AM +0100, Uwe Kleine-König wrote:
> > > while rebasing my series onto today's next I noticed the Subject being
> > > broken:
> > > 
> > > 	$Subject ~= s/Convert to //
> 
> I see you picked this patch, but you didn't drop the duplicated "Convert
> to " :-\
> 
> Also you didn't pick patches #2 - #5 which are tpm related, too.

Should be good now.

BR, Jarkko

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3B9D12F204
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Jan 2020 01:11:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726089AbgACALJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Jan 2020 19:11:09 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:55112 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbgACALJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Jan 2020 19:11:09 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 210AC516;
        Fri,  3 Jan 2020 01:11:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1578010266;
        bh=WzWxEa94iqGsV8/jwAsTxRyk8kDt6DYucmSsNmKCook=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Eg7o5RuNL3QIx0q4DD4G2qesMUjchevg6J7xY+1Oz/U168PkbQcE2eaKqK/scGhbf
         NrmEq2m+k35yp1stFGCzoJCt2R8lerkNRITkZBERVscSZfi7dCFFJuJrPoMuQKU+HM
         txJnYzTZVF7igW/8MiSX9zayhmM5n4O9L4bXcUCM=
Date:   Fri, 3 Jan 2020 02:10:56 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [RFC PATCH 3/5] i2c: core: add function to request an alias
Message-ID: <20200103001056.GJ4843@pendragon.ideasonboard.com>
References: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
 <20191231161400.1688-4-wsa+renesas@sang-engineering.com>
 <20200101165515.GC6226@pendragon.ideasonboard.com>
 <e008939f-531d-f7dc-4c3c-937476213030@lucaceresoli.net>
 <20200102211327.GB1030@kunai>
 <cc2a10ab-9f05-2c61-3a37-0e5e0184e379@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cc2a10ab-9f05-2c61-3a37-0e5e0184e379@lucaceresoli.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jan 02, 2020 at 11:27:57PM +0100, Luca Ceresoli wrote:
> Hi Wolfram,
> 
> On 02/01/20 22:13, Wolfram Sang wrote:
> > Hi Luca,
> > 
> >>> This looks quite inefficient, especially if the beginning of the range
> >>> is populated with devices. Furthermore, I think there's a high risk of
> >>> false negatives, as acquiring a free address and reprogramming the
> >>> client to make use of it are separate operations.
> >>
> >> Right. Applying the alias could raise other errors, thus one would need
> >> i2c_new_alias_device() to keep the alias locked until programming it has
> >> either failed or has been successfully programmed.
> > 
> > Please see my reply to Laurent, I don't think it is racy. But please
> > elaborate if you think I am wrong.
> 
> Uhm, you are right here, it's not racy. Sorry, I had read the code
> quickly and didn't notice the i2c_new_dummy_device() call.
> 
> So this means if i2c_new_alias_device() succeeds but the caller later
> fails while applying the alias, then it has to call
> i2c_unregister_device() to free the alias. Correct?

I was wrong as well, sorry about that.

> >>> What happened to the idea of reporting busy address ranges in the
> >>> firmware (DT, ACPI, ...) ?
> >>
> >> Indeed that's how I remember it as well, and I'm a bit suspicious about
> >> sending out probe messages that might have side effects (even if the
> >> false negative issue mentioned by Laurent were solved). You know, I've
> >> been taught to "expect the worse" :) so I'd like to better understand
> >> what are the strong reasons in favor of probing, as well as the
> >> potential side effects.
> > 
> > As I said to Laurent, too, I think the risk that a bus is not fully
> > described is higher than a device which does not respond to a read_byte.
> > In both cases, we would wrongly use an address in use.

I don't fully agree with this, I think we shouldn't impose a penalty on
every user because some device trees don't fully describe the hardware.
I think we should, at the very least, skip the probe and rely on DT if
DT explicitly states that all used addresses are listed. We discussed a
property to report addresses used by devices not described in DT, if
that property is listed I would prefer trusting DT.

> OK, I'm still uncomfortable with sending unexpected transactions to the
> dark outer space, but this is more a feeling than based on facts, and
> you know more than me, so I guess I can live with that.
> 
> > Also, all the best for you in 2020!
> 
> Thanks. Best wishes to you too for the new year!

Likewise. Let's start with a simple wish of getting this issue resolved
:-)


-- 
Regards,

Laurent Pinchart

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B460F52714A
	for <lists+linux-i2c@lfdr.de>; Sat, 14 May 2022 15:34:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232491AbiENNer (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 14 May 2022 09:34:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231148AbiENNeq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 14 May 2022 09:34:46 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AE352252B;
        Sat, 14 May 2022 06:34:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 210BEB808D0;
        Sat, 14 May 2022 13:34:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BD64C340EE;
        Sat, 14 May 2022 13:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652535282;
        bh=8HKS/AUN61t9V7UtQZ0kytJopRCt3BpmfFpmL+h0F6w=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=lxifP/BroIHqur0UKt/TVKixLWgRF6n3SdO8ckLc7JpXgEICZYE0bq3Rf1GlWG6Uy
         goJMvXQnILQA70uNFa47gPau/cuAaNSHgaD23vcZmidcldiLjEZSX/JW2jO+VnXfVm
         FkL84Jx2sxGoD6ZNFBo/wfUoRUzDltcKZPOLAzjbmA4ygFyJ2LLjFVxSCwCcLTUhHo
         d76eSmJB4Q9Q5xyG2EoHBV4M50JmMpa+KvByQfUiY7y6ql2zTwkeiNpU76Ndk82fcl
         D3YZ4gcgtdHtDGRPLj5gstd4BLXU6ue34G0km7FnD8XTN6Ck5nTSeTd6zqaabYq6Ny
         DgE7Hm2OOLavQ==
Date:   Sat, 14 May 2022 14:43:18 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     Peter Rosin <peda@axentia.se>, devicetree@vger.kernel.org
Cc:     Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
        Eddie James <eajames@linux.ibm.com>, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, lars@metafoo.de, miltonm@us.ibm.com,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 0/2] iio: humidity: si7020: Check device property for
 skipping reset in probe
Message-ID: <20220514144318.309be1ec@jic23-huawei>
In-Reply-To: <b2761479-50fe-0dce-62a2-3beff5cdef9d@axentia.se>
References: <20220512162020.33450-1-eajames@linux.ibm.com>
        <20220512174859.000042b6@Huawei.com>
        <4fd44316-689e-1b72-d483-2c617d2a455d@linux.ibm.com>
        <20220513174531.00007b9b@Huawei.com>
        <b2761479-50fe-0dce-62a2-3beff5cdef9d@axentia.se>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, 14 May 2022 00:48:51 +0200
Peter Rosin <peda@axentia.se> wrote:

> Hi!
> 
> 2022-05-13 at 18:45, Jonathan Cameron wrote:
> > On Thu, 12 May 2022 12:08:07 -0500
> > Eddie James <eajames@linux.ibm.com> wrote:
> >   
> >> On 5/12/22 11:48, Jonathan Cameron wrote:  
> >>> On Thu, 12 May 2022 11:20:18 -0500
> >>> Eddie James <eajames@linux.ibm.com> wrote:
> >>>    
> >>>> I2C commands issued after the SI7020 is starting up or after reset
> >>>> can potentially upset the startup sequence. Therefore, the host
> >>>> needs to wait for the startup sequence to finish before issuing
> >>>> further i2c commands. This is impractical in cases where the SI7020
> >>>> is on a shared bus or behind a mux, which may switch channels at
> >>>> any time (generating I2C traffic). Therefore, check for a device
> >>>> property that indicates that the driver should skip resetting the
> >>>> device when probing.    
> >>> Why not lock the bus?  It's not ideal, but then not resetting and hence
> >>> potentially ending up in an unknown state isn't great either.    
> >>
> >>
> >> Agreed, but locking the bus doesn't work in the case where the chip is 
> >> behind a mux. The mux core driver deselects the mux immediately after 
> >> the transfer to reset the si7020, causing some i2c traffic, breaking the 
> >> si7020. So it would also be a requirement to configure the mux to idle 
> >> as-is... That's why I went with the optional skipping of the reset. 
> >> Maybe I should add the bus lock too?
> >>  
> > 
> > +Cc Peter and linux-i2c for advice as we should resolve any potential
> > issue with the mux side of things rather than hiding it in the driver
> > (if possible!)  
> 
> IIUC, the chip in question cannot handle *any* action on the I2C bus
> for 15ms (or so) after a "soft reset", or something bad<tm> happens
> (or at least may happen).
> 
> If that's the case, then providing a means of skipping the reset is
> insufficient. If you don't lock the bus, you would need to *always*
> skip the reset, because you don't know for certain if something else
> does I2C xfers.
> 
> So, in order to make the soft reset not be totally dangerous even in
> a normal non-muxed environment, the bus must be locked for the 15ms.
> 
> However, Eddie is correct in that the I2C mux code may indeed do its
> muxing xfer right after the soft reset command. There is currently
> no way to avoid that muxing xfer. However, it should be noted that
> there are ways to mux an I2C bus without using xfers on the bus
> itself, so it's not problematic for *all* mux variants.
> 
> It can be debated if the problem should be worked around with extra
> dt properties like this, or if a capability should be added to delay
> a trailing muxing xfer.
> 
> I bet there are other broken chips that have drivers that do in fact
> lock the bus to give the chip a break, but then it all stumbles
> because of the unexpected noise if there's a (wrong kind of) mux in
> the mix.

Ok, so for now I think we need the bus lock for the reset + either
a work around similar to this series, or additions to the i2c mux code
to stop it doing a muxing xfer if the bus is locked?

Jonathan

> 
> Cheers,
> Peter
> 
> > 
> > Jonathan
> > 
> > 
> > 
> >   
> >>
> >> Thanks,
> >>
> >> Eddie
> >>
> >>  
> >>>
> >>> Jonathan
> >>>    
> >>>> Changes since v1:
> >>>>   - Fix dt binding document
> >>>>
> >>>> Eddie James (2):
> >>>>    dt-bindings: iio: humidity: Add si7020 bindings
> >>>>    iio: humidity: si7020: Check device property for skipping reset in probe
> >>>>
> >>>>   .../bindings/iio/humidity/silabs,si7020.yaml  | 47 +++++++++++++++++++
> >>>>   .../devicetree/bindings/trivial-devices.yaml  |  2 -
> >>>>   drivers/iio/humidity/si7020.c                 | 14 +++---
> >>>>   3 files changed, 55 insertions(+), 8 deletions(-)
> >>>>   create mode 100644 Documentation/devicetree/bindings/iio/humidity/silabs,si7020.yaml
> >>>>    
> >   


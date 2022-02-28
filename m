Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E49574C7D87
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Feb 2022 23:38:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231491AbiB1Wjb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Feb 2022 17:39:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231521AbiB1WjY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Feb 2022 17:39:24 -0500
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAC654CD4A;
        Mon, 28 Feb 2022 14:38:39 -0800 (PST)
Received: from hatter.bewilderbeest.net (174-21-187-98.tukw.qwest.net [174.21.187.98])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: zev)
        by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 5FF0B139;
        Mon, 28 Feb 2022 14:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
        s=thorn; t=1646087919;
        bh=2uC6078oH3Bjn5+qeOcOt6vnpU3SmGke5RIrxVw/quI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FZ7rnZFkjZ8C/yuOSSKaqEbPCDZXUV/GQa0MjtB27Dr1dNJRSo44erX1FbORiDDHH
         M2T5cFeytDEiGq/iGlDIz+GqRaEYEAov/DlIjaT6kSpeXExGWf/qh4q498F/dacnzM
         DjaFNUtTTolR8HupEEgwlSmelIK28uy0Es+fUGLU=
Date:   Mon, 28 Feb 2022 14:38:35 -0800
From:   Zev Weiss <zev@bewilderbeest.net>
To:     Peter Rosin <peda@axentia.se>
Cc:     linux-i2c@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>, openbmc@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] ic2: mux: pca9541: add delayed-release support
Message-ID: <Yh1O6w56zsNtNRbb@hatter.bewilderbeest.net>
References: <20220201001810.19516-1-zev@bewilderbeest.net>
 <ae14fd3c-2f50-b982-c61c-9db3bb28c809@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <ae14fd3c-2f50-b982-c61c-9db3bb28c809@axentia.se>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Peter,

Thanks for the reply!  (More below.)

On Mon, Feb 28, 2022 at 01:54:09PM PST, Peter Rosin wrote:
>On 2022-02-01 01:18, Zev Weiss wrote:
>> Hello,
>>
>> This series adds support for a new pca9541 device-tree property
>> ("release-delay-us"), which delays releasing ownership of the bus
>> after a transaction for a configurable duration, anticipating that
>> another transaction may follow shortly.  By avoiding a
>> release/reacquisition between transactions, this can provide a
>> substantial performance improvement for back-to-back operations -- on
>> a Delta AHE-50DC (ASPEED AST1250) system running OpenBMC with dozens
>> of LM25066 PMICs on PCA9541-arbitrated busses, a setting of 10000 (10
>> ms) reduces the median latency the psusensor daemon's hwmon sysfs file
>> reads from 2.28 ms to 0.99 ms (a 57% improvement).
>
>Hi!
>
>Sorry for the late reply. It seems I'm forever swamped...
>
>There is a risk with this scheme. If you have two (or more) of these
>chips on the same bus, and there are clients behind these two chips
>that have the same address, accesses to one of the clients might
>"leak through" the other arb to an unexpected client when its arb
>is in it's release-delay state.
>
>In other words, it is no coincidence that the segment lock is held
>over the whole acquire-access-release cycle.

That's not a scenario I had considered, but I think I see what you're 
saying.  Just to make sure I'm understanding correctly, the problematic 
situation you're describing would involve multiple (sibling, not 
parent/child cascaded) arbiters at distinct addresses on the same 
(master-side) bus, in effect acting as a sort of "distributed mux" in 
addition to arbitrating between multiple attached masters?  (So kind of 
an M-to-N arrangement between M masters and N busses.)

In which case if more than one of the arbiters had their downstream 
busses simultaneously connected to the same master (as could result if 
one were still connected due to a delayed release while the master had 
already started a subsequent transaction via another arbiter), the 
resulting "combined" bus could end up with address collisions between 
devices downstream of the arbiters if there are common addresses in use 
between the downstream busses.

>
>Sure, you can always say "don't add a release-delay when ...", but I
>see no such documentation.
>

Assuming I haven't misunderstood the above, would expanding the 
description of the property in the DT binding like so be sufficient?

  - release-delay-us: the number of microseconds to delay before
    releasing the bus after a transaction.  If unspecified the default
    is zero (the bus is released immediately).  Non-zero values can
    reduce arbitration overhead for back-to-back transactions, at the
    cost of delaying the other master's access to the bus.

    If this property is employed on hardware with multiple parallel
    (not cascaded) arbiters selecting between multiple downstream
    busses, address conflicts can occur if a device on one of the
    downstream busses uses the same address as a device on another
    downstream bus.  This property should thus only be used if either
    (a) there is only one arbiter on the bus, (b) multiple arbiters are
    strictly cascaded to a single downstream bus, or (c) all of the
    devices on all downstream busses use addresses that are unique
    across all of those busses.

If so I'll send a v3 with that change shortly.

Thanks,
Zev


Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE80759EDEB
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Aug 2022 23:02:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbiHWVBS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Aug 2022 17:01:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbiHWVBR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Aug 2022 17:01:17 -0400
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59F597C741;
        Tue, 23 Aug 2022 14:01:14 -0700 (PDT)
Received: from booty (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id BE551E0006;
        Tue, 23 Aug 2022 21:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1661288473;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uw23ZoP4oRVNIqUUbuxky1/ZKiVgZT6Zum30X3pKMxM=;
        b=FELmDJgeYbw0KO2g4ykO3AGxnJ02o2MIf4t0E5/eZU0QyjyNgyf76zB9WEZLRuDb5JhB5e
        wPHDHyuWia2G5Zhgkbx6v0sO68rUOloj06XhyvxgtivILokTnd9hZhQsiP+YHqcSgdydZq
        HLrvjmeWgB95UTTvJnsSPz5/4VuOAEAklqqR7cNDs7qx5SuJB5yipcqriTnPPCGG//XKO2
        UwZKYhlrppF36Q+Nn5j7Wu8lx7VcNW8DNPhlC6O1WSJRNlLHLitm/bpCE26BcH2wJB2fT3
        EOPSKjqZh4vg+fq5Bco4U5zNDq+et62qA1BJ3YCsFgOREJQMhPG/0ECsyLqRTw==
Date:   Tue, 23 Aug 2022 23:01:10 +0200
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Peter Rosin <peda@axentia.se>
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] docs: i2c: i2c-topology: reorder sections more
 logically
Message-ID: <20220823230110.115a3fc5@booty>
In-Reply-To: <19a22449-c9fb-1eba-9a47-3e3d340a13a1@axentia.se>
References: <20220822091050.47099-1-luca.ceresoli@bootlin.com>
        <20220822091050.47099-3-luca.ceresoli@bootlin.com>
        <19a22449-c9fb-1eba-9a47-3e3d340a13a1@axentia.se>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Peter,

On Tue, 23 Aug 2022 11:26:51 +0200
Peter Rosin <peda@axentia.se> wrote:

> 2022-08-22 at 11:10, luca.ceresoli@bootlin.com wrote:
> > From: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > 
> > The sequence of sections is a bit confusing here:
> > 
> >  * we list the mux locking scheme for existing drivers before introducing
> >    what mux locking schemes are
> >  * we list the caveats for each locking scheme (which are tricky) before
> >    the example of the simple use case
> > 
> > Restructure it entirely with the following logic:
> > 
> >  * Intro ("I2C muxes and complex topologies")
> >  * Locking
> >    - mux-locked
> >      - example
> >      - caveats
> >    - parent-locked
> >      - example
> >      - caveats
> >  * Complex examples
> >  * Mux type of existing device drivers
> > 
> > While there, also apply some other improvements:
> > 
> >  * convert the caveat list from a table (with only one column carrying
> >    content) to a bullet list.  
> 
> I want to be able to refer to a specific caveat if/when someone has
> questions, so I prefer to have the caveats "named". Not that this is
> very frequent, but if we do remove the tags now I'm sure I'm going
> to need them a few minutes later...

Now I realize the reason for those labels. Thank you for taking time to
explain!

What about this one:

  [ML1]
    If you build a topology with ...

It's a definition list, and the [ML1] gets rendered in bold.

The advantage is the text is still rendered as a regular paragraph,
with the same font etc, except the left margin is increased.

> > +Parent-locked Caveats
> > +~~~~~~~~~~~~~~~~~~~~~
> > +
> > +When using a parent-locked mux, be aware of the following restrictions:
> > +
> > +* If you build a topology with a parent-locked mux being the child
> > +  of another mux, this might break a possible assumption from the
> > +  child mux that the root adapter is unused between its select op
> > +  and the actual transfer (e.g. if the child mux is auto-closing
> > +  and the parent mux issues I2C transfers as part of its select).
> > +  This is especially the case if the parent mux is mux-locked, but
> > +  it may also happen if the parent mux is parent-locked.
> > +
> > +* If select/deselect calls out to other subsystems such as gpio,
> > +  pinctrl, regmap or iio, it is essential that any I2C transfers
> > +  caused by these subsystems are unlocked. This can be convoluted to
> > +  accomplish, maybe even impossible if an acceptably clean solution
> > +  is sought.
> > +
> > +
> >    
> 
> Three empty lines is excessive and inconsistent with the other two
> ===-headers.

Indeed! Fix ready for v3, waiting on the above proposal.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

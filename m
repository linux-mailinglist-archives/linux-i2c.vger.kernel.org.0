Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83A9158D431
	for <lists+linux-i2c@lfdr.de>; Tue,  9 Aug 2022 09:06:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236411AbiHIHGx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 9 Aug 2022 03:06:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235273AbiHIHGs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 9 Aug 2022 03:06:48 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2006331;
        Tue,  9 Aug 2022 00:06:46 -0700 (PDT)
Received: from booty (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 8CB1D100002;
        Tue,  9 Aug 2022 07:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1660028805;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VMrcDXpBGGCK7mGn1amGX78TuOk24yeivWuXs5vVbIE=;
        b=d7bO5BfDJkDfKZCNkTAp2X/lAaQtj1R+x58CcEl0OwF/PPnd/uK0TqmFhVZa6K78DZVSKU
        t460/eJg025bX3YHxKO+0QavfqjL/X5+cQglBKYYZYQUqMN1gSqmYa5BuV780FwzAfFiDk
        YgC5E0LNFj06qtxUzm24+SzFbDPPzJguBunFQG0nNnAdZkxU0Wae6fnNqPztZsw8zFXqcQ
        Q3syLuHqGZw/mIAkaafV/uCwJAPEIUn0qT+FF3uj1wuD8f/IhaYs9ZkML7HIplq9mXov9P
        5KR68iJnkUFeLeYm+cljjoE+RL8ouapB9c+07+YglvkNCEj9k8AegmppJ2EfNQ==
Date:   Tue, 9 Aug 2022 09:06:42 +0200
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>, Peter Rosin <peda@axentia.se>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/9] docs: i2c: i2c-topology: reorder sections more
 logically
Message-ID: <20220809090642.7bd2624e@booty>
In-Reply-To: <3971c298-9c9a-83a1-8dc7-5d59dd0e1a05@gmail.com>
References: <20220808141708.1021103-1-luca.ceresoli@bootlin.com>
        <20220808141708.1021103-8-luca.ceresoli@bootlin.com>
        <3971c298-9c9a-83a1-8dc7-5d59dd0e1a05@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Bagas,

thanks for the prompt review!

On Tue, 9 Aug 2022 09:08:03 +0700
Bagas Sanjaya <bagasdotme@gmail.com> wrote:

> On 8/8/22 21:17, luca.ceresoli@bootlin.com wrote:
> > +Mux-locked caveats
> > +~~~~~~~~~~~~~~~~~~
> > +
> > +When using a mux-locked mux, be aware of the following restrictions:
> > +
> > +* If you build a topology with a mux-locked mux being the parent
> > +  of a parent-locked mux, this might break the expectation from the
> > +  parent-locked mux that the root adapter is locked during the
> > +  transaction.
> > +
> > +* It is not safe to build arbitrary topologies with two (or more)
> > +  mux-locked muxes that are not siblings, when there are address
> > +  collisions between the devices on the child adapters of these
> > +  non-sibling muxes.
> > +
> > +  I.e. the select-transfer-deselect transaction targeting e.g. device
> > +  address 0x42 behind mux-one may be interleaved with a similar
> > +  operation targeting device address 0x42 behind mux-two. The
> > +  intension with such a topology would in this hypothetical example
> > +  be that mux-one and mux-two should not be selected simultaneously,
> > +  but mux-locked muxes do not guarantee that in all topologies.
> > +  
> 
> These two sentences in n. 2) can be combined into a single paragraph.
> Also, did you mean s/intension/intention/?

This patch does nothing but reformatting the current text.

Definitely "intension" is a mistake that I didn't spot, I'm adding a
patch to fix that.

About the paragraph split, I have no strong opinion but I'm feeling OK
with the current layout. It splits the generic statement from the
example and IMHO helps readability. Feel free to send a patch to change
that though, if you think it is useful.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

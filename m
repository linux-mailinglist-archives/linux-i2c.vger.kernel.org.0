Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38821537498
	for <lists+linux-i2c@lfdr.de>; Mon, 30 May 2022 09:23:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233248AbiE3HGC convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Mon, 30 May 2022 03:06:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232759AbiE3HGB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 May 2022 03:06:01 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BA20719DB;
        Mon, 30 May 2022 00:05:59 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 902CB1C0B8A; Mon, 30 May 2022 09:05:56 +0200 (CEST)
Date:   Mon, 30 May 2022 09:05:55 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Ondrej Jirman <x@xff.cz>
Subject: Re: [PATCH 3/5] Input: pinephone-keyboard - Build in the default
 keymap
Message-ID: <20220530070555.GA1363@bug>
References: <20220129230043.12422-1-samuel@sholland.org>
 <20220129230043.12422-4-samuel@sholland.org>
 <Yfg8crUuCLO0SxVj@google.com>
 <cf0f85bb-c4ff-a061-ff66-289fe10511c5@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <cf0f85bb-c4ff-a061-ff66-289fe10511c5@sholland.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi!

> > On Sat, Jan 29, 2022 at 05:00:40PM -0600, Samuel Holland wrote:
> >> The PinePhone keyboard comes with removable keys, but there is a default
> >> layout labeled from the factory. Use this keymap if none is provided in
> >> the devicetree.
> > 
> > Why can't we require to have it in device tree?
> 
> We can. I am okay with dropping this patch and making the properties required if
> that is preferred.
> 
> The keyboard is supported on at least four device trees (three revisions of
> PinePhone, plus the PinePhone Pro), so moving the default keymap to the driver
> avoids duplicating that block of data in each device tree/overlay.

#include is supported on dts, so there's no need to duplicate the keymaps, etc.

Best regards,
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

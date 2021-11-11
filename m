Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D86244DBB2
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Nov 2021 19:43:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233787AbhKKSqI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Nov 2021 13:46:08 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:53211 "EHLO
        wnew1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233575AbhKKSqI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Nov 2021 13:46:08 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.west.internal (Postfix) with ESMTP id 917A52B01481;
        Thu, 11 Nov 2021 13:43:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 11 Nov 2021 13:43:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.in; h=
        date:from:to:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=PGgunZVpj38XYZcYLfPCOQoENOw
        7BhxHX2TPIJ6SG9o=; b=IKbUwddOVGne+QsO6GS9Hcgle4iTFIIi1P4W1uKIh4P
        OUr/VQtl8nPM7nbXFr/PKLvt1DZ6MAm1s/sJ//gExwNIki17QIaUYZml3BSiPcg3
        sF+a6Vtgxm9YgEH9+LH4K9QiphzXyCjlIa9Ko+ZaW8/3uxWJyZIuy3NSVNl2Hkoo
        ougBc6VBc9TX9/77TQmzzC3Fbpek5tJEDZSIBNDZw49axBEgZ7hn8ROVmEZOyw7p
        bcWRfHgWr0XcE6hHB8yvQ6UPt37IqIUSF3Y9yGNgbU72qC3X3+vItuEBi3HanzIX
        v7Kbda4OnByv3Vl/wcfXKFSzmTXkCpz5GpT9jd957tw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=PGgunZ
        Vpj38XYZcYLfPCOQoENOw7BhxHX2TPIJ6SG9o=; b=N1wVtYx3NYPWa1BvJ6Mb/p
        KYE3byRWGUFxlxoOQ31vIpcEee6L4HV9Xh5+/GeK9JtC5Uv4KRu4vCY2cxc5fpxA
        BKkHtto9a6iiUe2xtXe2+pGH2v0Q8Cp/H9JHXeUyojECuNk+YkLbN517D59wK3mG
        E2VJPrOjUtxvGnOnWQiEtDzk7paG2T1JwE8v3jfnWh+SAHadc/+xQqq3AVLuaXuj
        Ut1GORC63jRkXaMK3KGjjXO8CuabdNk/9Lu91grjFT3DqhNdQslWgljyY6X8W2Wb
        Qz/AxSw+FdeSwGdUKNH+Q7G8GBpyQZwJK913DFO+m3AucJIYX3YsnTqyzfe1bh6Q
        ==
X-ME-Sender: <xms:RWSNYZzCLa0UkfZpDFhxO5wxlixOQxamCFE4dVv1zoEA56Vp8USUww>
    <xme:RWSNYZQgGtF2sFIz1Ph6N0DFobKGsi9oRPgM83hrL0TefPZxh8L7Tk45WHcgkC4c3
    L-NgJlcS_GCFajpI2A>
X-ME-Received: <xmr:RWSNYTUvNdmbcOfVcIfGW_QYuiEDAmdn6gbQVXVOEdgAPqdrTT6kkXcvZJjF1g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrvddugdduudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeffvggvphcu
    ofgrjhhumhguvghruceouggvvghpsehfrghsthhmrghilhdrihhnqeenucggtffrrghtth
    gvrhhnpeetudfhfeejhfefledugfehkefhkedugeduhffhgedtheffffelueeuffffffdt
    feenucffohhmrghinhepnhigphdrtghomhdpphholhholhhurdgtohhmpdgrrhgthhhivg
    hvvgdrohhrghdprghrtghhihhvvgdrohhrghenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpeguvggvphesfhgrshhtmhgrihhlrdhinh
X-ME-Proxy: <xmx:RWSNYbgjzgOWtOXD6lEgYlBuQaX852j-kzfo8t6ow-z-HvDEUdZ7Dg>
    <xmx:RWSNYbBJwIxOZ1ZdnMWtdK1U1WQciQxBqUD_OXMSVTfZaKr0Y5eatA>
    <xmx:RWSNYUIcOr9KRRtUY6KsYAy_K4d65szsi534P-oxD0zPkBcyb-EwQQ>
    <xmx:RWSNYePcyEVvVr_zApRW8QOgvyhOgzv41mmMJp6wxb76PhACvpYkB3DKbjo>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Nov 2021 13:43:16 -0500 (EST)
Date:   Fri, 12 Nov 2021 00:13:07 +0530
From:   Deep Majumder <deep@fastmail.in>
To:     Wolfram Sang <wsa@kernel.org>, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Docs: Fixes link to I2C specification
Message-ID: <20211111184307.6ld75ektg6avb3wb@pop-os.localdomain>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211104060018.35570-1-deep@fastmail.in>
 <YYWqGyETMgKcIkul@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YYWqGyETMgKcIkul@kunai>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Wolfram Sang wrote:
> On Thu, Nov 04, 2021 at 11:30:18AM +0530, Deep Majumder wrote:
> > The link to the I2C specification is broken and is replaced in this
> > patch by one that points to Rev 6 (2014) of the specification.
> > Although `https://www.nxp.com" hosts the Rev 7 (2021) of this
> > specification, it is behind a login-wall and thus cannot be used.
> > 
> > Signed-off-by: Deep Majumder <deep@fastmail.in>
> 
> Thanks for pointing out this issue!
> 
> >  The official I2C specification is the `"I2C-bus specification and user
> > -manual" (UM10204) <https://www.nxp.com/docs/en/user-guide/UM10204.pdf>`_
> > +manual" (UM10204) <https://www.pololu.com/file/0J435/UM10204.pdf>`_
> 
> I'd think we should have two links. One to the latest official specs,
> even though it is behind a login wall. And one to the latest free
> version. For that, I think the archieve.org address which Wikipedia uses
> is more stable thant the pololu address from above:
> 
> https://web.archive.org/web/20210813122132/https://www.nxp.com/docs/en/user-guide/UM10204.pdf
> 
> What do you think?
> 
Yes, I agree. Should I update the patch and re-send it?


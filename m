Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 575AF21B52E
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Jul 2020 14:37:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727819AbgGJMh0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Jul 2020 08:37:26 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:55405 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726664AbgGJMhZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Jul 2020 08:37:25 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id 420E9BA0;
        Fri, 10 Jul 2020 08:37:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 10 Jul 2020 08:37:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm3; bh=d
        gJ3aoc5NiXYKfv58xR0xZCsr1W6r/7ugdtfPSWBvns=; b=b8A3eBvXkGhpO3lzR
        E7vusMZO/bWx2sr5lbEDQlvB7LDwVl2pMdAaevv0E6Ar/Xih61VxsTZnrWr7Aopd
        S2JcAX+pU1IfYUr0Ro7p4CnIS3kovnn2vMUhqsssIflFuUog5cUy7zlKSW4tmuHO
        ZTkF8udIHqJcsFmxk0kUWGSmaGVaEQmjUiEVvEjwdHvGS0OP9X9NakAN/qnw/4fc
        aePE2w/U4vi9b/cMJqJpc5bekWzOvIsq9ggOc4Nu+X/N5vkun8WmdjOhwxtaX1cP
        kFoxETysvQN7RWeYc84CJ0Cqm2dPFeAQj9drqtiHXA0ELV9RFglTq8XHpiXqkHhw
        2RctA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=dgJ3aoc5NiXYKfv58xR0xZCsr1W6r/7ugdtfPSWBv
        ns=; b=HQr9HBfRjC1cXeIA07LYz0c8ZamnWXn2wJ9N3Nj/pajxSKNL/CI60HxKA
        8UBhyHNugxVf7roSxTMmmijjNLUd6CyymkFix+iqkm0I26iEZomS6C3h5LWs/jB4
        08EzYiXkZ5udacOmMwRASP0BzrdpczgnuWOGjUqZHq/lgGvzfMaJKwp0bI638aJz
        c0dIoZa8eZO0sBltDxRbU7WSlU+TNEJ2p6RDg2XaAhkRv7IBsg0JyRqeCuItvR+c
        sKM8n8XxsleTUW33QGedESvk0EgAXha5EdU1zUa26O5J2cmeUbTFjOPNrHX76BHp
        QKkf81q/kdmT/dCEp4Ihxc6GxGB9A==
X-ME-Sender: <xms:AGEIX_VF2YIwxQaPlLqg_g5PHHnYRxNeQRosxYlfcLyEksUZj8-2Bw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrvddugdehkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggugfgjsehtqhertddttdejnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepgfejjeekjedttdethedtfeelteefffduvdevvdfhtdeiudetleejgeelfeef
    uedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:AGEIX3kDLyfuDnJt50RhzCZPlSqB-rJAjUgyjDOis3SzVSKCHCF87w>
    <xmx:AGEIX7aIDwXxD3jn55JAYhPPObaFEh-JIStZ6a4YUpJi7Os11x_Mmw>
    <xmx:AGEIX6UlHD0EEf_cfp9_nX1DnacYVENmET5iVTpGLWVs_MqF1LVxYA>
    <xmx:AWEIX9wL-1fAtDVWrg48pkcLVkqVqeWUIkk6jPlS_yXa5LvudaavZFsTLGo>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id A08D2328005D;
        Fri, 10 Jul 2020 08:37:19 -0400 (EDT)
Date:   Fri, 10 Jul 2020 14:37:18 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
        Frank Lee <frank@allwinnertech.com>, robh+dt@kernel.org,
        wens@csie.org, mturquette@baylibre.com, sboyd@kernel.org,
        gregory.clement@bootlin.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org,
        srinivas.kandagatla@linaro.org, linus.walleij@linaro.org,
        anarsoul@gmail.com, tiny.windzz@gmail.com, rui.zhang@intel.com,
        daniel.lezcano@linaro.org, amit.kucheria@verdurent.com,
        lee.jones@linaro.org, p.zabel@pengutronix.de, clabbe@baylibre.com,
        icenowy@aosc.io, stefan@olimex.com, bage@linutronix.de,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        liyong@allwinnertech.com, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, huangshuosheng@allwinnertech.com,
        linux-i2c@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 04/16] dt-bindings: pinctrl: sunxi: make gpio banks
 supplies required
Message-ID: <20200710123718.mrvtk6rzkfuno5kn@gilmour.lan>
References: <20200708071942.22595-1-frank@allwinnertech.com>
 <20200708071942.22595-5-frank@allwinnertech.com>
 <20200709171713.tutnlchji4e6i5pv@core.my.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200709171713.tutnlchji4e6i5pv@core.my.home>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Thu, Jul 09, 2020 at 07:17:13PM +0200, Ond=C5=99ej Jirman wrote:
> Hello,
>=20
> On Wed, Jul 08, 2020 at 03:19:30PM +0800, Frank Lee wrote:
> > Since we don't really have to care about the existing DT for boards,
> > it would be great to make the gpio banks supplies required.
>=20
> What if the borad doesn't use one of the banks? How would
> I describe such a board if defining supplies for all banks
> is required?

If that case ever comes up, we can always drop the requirement, it's going =
to be backward
compatible.

Maxime

Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CABF414B6F
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2019 16:02:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726394AbfEFOCv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 May 2019 10:02:51 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:39314 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbfEFOCu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 May 2019 10:02:50 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 1F19725AED5;
        Tue,  7 May 2019 00:02:48 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 0706CE21327; Mon,  6 May 2019 16:02:46 +0200 (CEST)
Date:   Mon, 6 May 2019 16:02:45 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/7] dts: r7s9210: Add RZ/A2 devices
Message-ID: <20190506140245.obsc5g44uvh6awxb@verge.net.au>
References: <20190430132309.12473-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190430132309.12473-1-chris.brandt@renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Apr 30, 2019 at 08:23:02AM -0500, Chris Brandt wrote:
> So while I added RZ/A2 drivers a while back, I never actually added them
> all to the device tree.
> 
> This series adds everything that is currently supported.
> 
> Chris Brandt (7):
>   ARM: dts: r7s9210: Add RSPI
>   ARM: dts: r7s9210: Add Ethernet support
>   dt-bindings: i2c: riic: document r7s9210 support
>   ARM: dts: r7s9210: Add RIIC support
>   ARM: dts: r7s9210: Add SDHI support
>   ARM: dts: r7s9210-rza2mevb: Add Ethernet support
>   ARM: dts: r7s9210-rza2mevb: Add SDHI support

Thanks Chris,

I have applied the dts patches for inclusion in v5.3.
Please consider a follow-up patch to add an alias as
per Geert's feedback on the Ethernet support patch.

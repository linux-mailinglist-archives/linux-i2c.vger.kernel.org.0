Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DCAA46B64F
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Dec 2021 09:46:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233173AbhLGIth (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Dec 2021 03:49:37 -0500
Received: from ixit.cz ([94.230.151.217]:57944 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229846AbhLGIth (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 Dec 2021 03:49:37 -0500
Received: from [127.0.0.1] (ip-89-176-96-70.net.upcbroadband.cz [89.176.96.70])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 7A33721F5E;
        Tue,  7 Dec 2021 09:46:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1638866764;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=f9NukqFBTsggR/WpNLr3kIERvGsIMZF+z2E9KVqGv+8=;
        b=DMC+q23hWJ44vyyPytXKyrX2yQjDPgGW0e51OoaY8T7s5u4kdq3iEKVERRiH5MFdoLRodH
        bQqBP7Y63ZMiYnIjp8UR0esCI0nBJBvsGcj55AsIv4Q7GsRxlkmi7mg1y81Zzj2ANorDsL
        2F6FJJSJchTkWALwS+yUBgpTAqZvnCs=
Date:   Tue, 07 Dec 2021 08:46:03 +0000
From:   David Heidelberg <david@ixit.cz>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Stephen Warren <swarren@wwwdotorg.org>
CC:     ~okias/devicetree@lists.sr.ht, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_dt-bindings=3A_i2c=3A_brcm=2C?= =?US-ASCII?Q?bcm2835-i2c=3A_convert_to_YAML_schema?=
In-Reply-To: <d337e0e9-7013-b10f-f696-5133da3490e5@gmail.com>
References: <20211206184613.100809-1-david@ixit.cz> <d337e0e9-7013-b10f-f696-5133da3490e5@gmail.com>
Message-ID: <40FA507D-825B-4C9D-A190-66797AEC2DF2@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Florian,

thanks for looking into patch=2E Currently I'm picking missing and broken =
bindings, which has biggest impact on arm64 make dtbs_check output, to give=
 developers chance to use it to find their problems instead of being overwh=
elmed by thousands lines of usually irrelevant warnings not related to DTS =
their writing=2E So feel free to continue, I'm very happy that there is mor=
e people trying make dtbs_check output clean and DT validated :)

David


-------- P=C5=AFvodn=C3=AD zpr=C3=A1va --------
Odes=C3=ADlatel: Florian Fainelli <f=2Efainelli@gmail=2Ecom>
Odesl=C3=A1no: 6=2E prosince 2021 22:27:49 UTC
Komu: David Heidelberg <david@ixit=2Ecz>, Rob Herring <robh+dt@kernel=2Eor=
g>, Ray Jui <rjui@broadcom=2Ecom>, Scott Branden <sbranden@broadcom=2Ecom>,=
 bcm-kernel-feedback-list@broadcom=2Ecom, Nicolas Saenz Julienne <nsaenz@ke=
rnel=2Eorg>, Stephen Warren <swarren@wwwdotorg=2Eorg>
Kopie: ~okias/devicetree@lists=2Esr=2Eht, linux-i2c@vger=2Ekernel=2Eorg, d=
evicetree@vger=2Ekernel=2Eorg, linux-rpi-kernel@lists=2Einfradead=2Eorg, li=
nux-arm-kernel@lists=2Einfradead=2Eorg, linux-kernel@vger=2Ekernel=2Eorg
P=C5=99edm=C4=9Bt: Re: [PATCH] dt-bindings: i2c: brcm,bcm2835-i2c: convert=
 to YAML schema

On 12/6/21 10:46 AM, David Heidelberg wrote:
> Switch the DT binding to a YAML schema to enable the DT validation=2E
>=20
> Signed-off-by: David Heidelberg <david@ixit=2Ecz>

Acked-by: Florian Fainelli <f=2Efainelli@gmail=2Ecom>
Tested-by: Florian Fainelli <f=2Efainelli@gmail=2Ecom>

Let me know if you are planning on converting more of the bcm2835
binding so we don't overlap=2E Thanks!

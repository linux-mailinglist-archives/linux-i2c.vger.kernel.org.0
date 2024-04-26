Return-Path: <linux-i2c+bounces-3214-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 049348B369B
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 13:41:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2800F1C21DB8
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 11:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26C27145335;
	Fri, 26 Apr 2024 11:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mrhsGwcR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC0B144D3F;
	Fri, 26 Apr 2024 11:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714131701; cv=none; b=o6FVSxPA3KvRq2C3oqSAbGNJY7BE97hImDgf3SApU1QUKTEFaobUaVGrJrLfo6sYo0EubUzOR6oojgTUl1lOT9DC2KOzQL/p09PF/B7UP7LJajEnjBAsUEEPfQml4MtIWsvvP58ix0c8daeQRaCIqqCWS75fRyfoZHdfs19QIlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714131701; c=relaxed/simple;
	bh=YyiC/xKTo3XyOrHX7I63STVttfSHY4iRfLYrAalRZWo=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=ctd3+zVjeU3Q68mDfuMqZynOGdC0xXtssqDnshPm05iIqlqGoQtdQep3A72tRP7+3bS+Ggdvxfv2pHVHw2wjBSk5sZAB3ZEokrUtKimBD1gExikUXDo/9BGero0jWTUiWgCjIBbgqlEiwcQrAaPOfOMVWZ1/EYTMt2YtrrXHDkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mrhsGwcR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61F92C113CE;
	Fri, 26 Apr 2024 11:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714131700;
	bh=YyiC/xKTo3XyOrHX7I63STVttfSHY4iRfLYrAalRZWo=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=mrhsGwcR3HpgFGasxnnDrYsBR4l9VQfKS1R0+TB8cP0Ze1By5okzAVjpWiNYBi+3+
	 i1YvuFAqPWB+vqqZ8yPp5B0mqPJZgnw4LQIEYUVb8Vi1FcPsSv4shjw1lVzpkOiGHp
	 k3Ss/qOQuMiJ/mHJEtfYwjUw3ZBOKfx7T5jikbR5tq7P3bll9s5nd72lYcaXsVs6Dd
	 WKF39POd4250TrrHvM5gpKdYweoe1DBuqTsu3AtHSKmHKBo8TyJy6yjYVP7hE2Tmit
	 V8NxEAV4VuJTQH57dJag/kMKfwM3JHs3VTzDw5WOGiNQ8/zyRaT5+36BnJKD5LZ4kx
	 arOdZ+O9DoU4g==
Date: Fri, 26 Apr 2024 06:41:39 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: "zoie.lin" <zoie.lin@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
In-Reply-To: <20240426102949.23057-3-zoie.lin@mediatek.com>
References: <20240426102949.23057-1-zoie.lin@mediatek.com>
 <20240426102949.23057-3-zoie.lin@mediatek.com>
Message-Id: <171413169824.1152237.3973093428639305133.robh@kernel.org>
Subject: Re: [PATCH 2/3] dt-bindings: eeprom: at24: Add support for at24c64


On Fri, 26 Apr 2024 18:29:48 +0800, zoie.lin wrote:
> From: Zoie Lin <zoie.lin@mediatek.com>
> 
> Update EEPROM bindings to include Atmel AT24C64
> 
> Signed-off-by: Zoie Lin <zoie.lin@mediatek.com>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/misc/idt,89hpesx.example.dtb: idt@74: eeprom@50:compatible: More than one condition true in oneOf schema:
	{'oneOf': [{'allOf': [{'items': [{'pattern': '^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),(24(c|cs|lc|mac)[0-9]+|spd)$'},
	                                 {'pattern': '^atmel,(24(c|cs|mac)[0-9]+|spd)$'}],
	                       'maxItems': 2,
	                       'minItems': 1,
	                       'type': 'array'},
	                      {'oneOf': [{'items': {'pattern': 'c00$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c01$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs01$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c02$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs02$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'mac402$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'mac602$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c04$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs04$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c08$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs08$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c16$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs16$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c32$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c32d-wl$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs32$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c64$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c64d-wl$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs64$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c128$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs128$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c256$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs256$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c512$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs512$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c1024$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs1024$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c1025$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs1025$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c2048$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs2048$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'spd$'},
	                                  'type': 'array'}]}]},
	           {'items': [{'const': 'belling,bl24c16a'},
	                      {'const': 'atmel,24c16'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'},
	           {'items': [{'enum': ['rohm,br24g01', 'rohm,br24t01']},
	                      {'const': 'atmel,24c01'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'},
	           {'items': [{'enum': ['nxp,se97b', 'renesas,r1ex24002']},
	                      {'const': 'atmel,24c02'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'},
	           {'items': [{'enum': ['onnn,cat24c04',
	                                'onnn,cat24c05',
	                                'rohm,br24g04']},
	                      {'const': 'atmel,24c04'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'},
	           {'items': [{'const': 'renesas,r1ex24016'},
	                      {'const': 'atmel,24c16'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'},
	           {'items': [{'const': 'giantec,gt24c32a'},
	                      {'const': 'atmel,24c32'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'},
	           {'items': [{'const': 'atmel,24c64'}],
	            'maxItems': 1,
	            'minItems': 1,
	            'type': 'array'},
	           {'items': [{'enum': ['renesas,r1ex24128',
	                                'samsung,s524ad0xd1']},
	                      {'const': 'atmel,24c128'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'}]}
	from schema $id: http://devicetree.org/schemas/misc/idt,89hpesx.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/misc/idt,89hpesx.example.dtb: idt@74: eeprom@50: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/misc/idt,89hpesx.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/misc/idt,89hpesx.example.dtb: eeprom@50: compatible: More than one condition true in oneOf schema:
	{'oneOf': [{'allOf': [{'items': [{'pattern': '^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),(24(c|cs|lc|mac)[0-9]+|spd)$'},
	                                 {'pattern': '^atmel,(24(c|cs|mac)[0-9]+|spd)$'}],
	                       'maxItems': 2,
	                       'minItems': 1,
	                       'type': 'array'},
	                      {'oneOf': [{'items': {'pattern': 'c00$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c01$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs01$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c02$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs02$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'mac402$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'mac602$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c04$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs04$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c08$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs08$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c16$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs16$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c32$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c32d-wl$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs32$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c64$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c64d-wl$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs64$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c128$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs128$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c256$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs256$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c512$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs512$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c1024$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs1024$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c1025$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs1025$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c2048$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs2048$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'spd$'},
	                                  'type': 'array'}]}]},
	           {'items': [{'const': 'belling,bl24c16a'},
	                      {'const': 'atmel,24c16'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'},
	           {'items': [{'enum': ['rohm,br24g01', 'rohm,br24t01']},
	                      {'const': 'atmel,24c01'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'},
	           {'items': [{'enum': ['nxp,se97b', 'renesas,r1ex24002']},
	                      {'const': 'atmel,24c02'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'},
	           {'items': [{'enum': ['onnn,cat24c04',
	                                'onnn,cat24c05',
	                                'rohm,br24g04']},
	                      {'const': 'atmel,24c04'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'},
	           {'items': [{'const': 'renesas,r1ex24016'},
	                      {'const': 'atmel,24c16'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'},
	           {'items': [{'const': 'giantec,gt24c32a'},
	                      {'const': 'atmel,24c32'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'},
	           {'items': [{'const': 'atmel,24c64'}],
	            'maxItems': 1,
	            'minItems': 1,
	            'type': 'array'},
	           {'items': [{'enum': ['renesas,r1ex24128',
	                                'samsung,s524ad0xd1']},
	                      {'const': 'atmel,24c128'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'}]}
	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/misc/idt,89hpesx.example.dtb: eeprom@50: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/nvmem/layouts/onie,tlv-layout.example.dtb: eeprom@56: compatible: More than one condition true in oneOf schema:
	{'oneOf': [{'allOf': [{'items': [{'pattern': '^(atmel|catalyst|microchip|nxp|ramtron|renesas|rohm|st),(24(c|cs|lc|mac)[0-9]+|spd)$'},
	                                 {'pattern': '^atmel,(24(c|cs|mac)[0-9]+|spd)$'}],
	                       'maxItems': 2,
	                       'minItems': 1,
	                       'type': 'array'},
	                      {'oneOf': [{'items': {'pattern': 'c00$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c01$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs01$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c02$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs02$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'mac402$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'mac602$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c04$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs04$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c08$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs08$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c16$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs16$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c32$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c32d-wl$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs32$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c64$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c64d-wl$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs64$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c128$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs128$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c256$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs256$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c512$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs512$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c1024$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs1024$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c1025$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs1025$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'c2048$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'cs2048$'},
	                                  'type': 'array'},
	                                 {'items': {'pattern': 'spd$'},
	                                  'type': 'array'}]}]},
	           {'items': [{'const': 'belling,bl24c16a'},
	                      {'const': 'atmel,24c16'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'},
	           {'items': [{'enum': ['rohm,br24g01', 'rohm,br24t01']},
	                      {'const': 'atmel,24c01'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'},
	           {'items': [{'enum': ['nxp,se97b', 'renesas,r1ex24002']},
	                      {'const': 'atmel,24c02'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'},
	           {'items': [{'enum': ['onnn,cat24c04',
	                                'onnn,cat24c05',
	                                'rohm,br24g04']},
	                      {'const': 'atmel,24c04'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'},
	           {'items': [{'const': 'renesas,r1ex24016'},
	                      {'const': 'atmel,24c16'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'},
	           {'items': [{'const': 'giantec,gt24c32a'},
	                      {'const': 'atmel,24c32'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'},
	           {'items': [{'const': 'atmel,24c64'}],
	            'maxItems': 1,
	            'minItems': 1,
	            'type': 'array'},
	           {'items': [{'enum': ['renesas,r1ex24128',
	                                'samsung,s524ad0xd1']},
	                      {'const': 'atmel,24c128'}],
	            'maxItems': 2,
	            'minItems': 2,
	            'type': 'array'}]}
	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/nvmem/layouts/onie,tlv-layout.example.dtb: eeprom@56: Unevaluated properties are not allowed ('compatible' was unexpected)
	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240426102949.23057-3-zoie.lin@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



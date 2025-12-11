Return-Path: <linux-i2c+bounces-14504-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B56CB5794
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Dec 2025 11:14:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B850302C207
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Dec 2025 10:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6685279DB3;
	Thu, 11 Dec 2025 10:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JfxNgHax"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAE21C860C
	for <linux-i2c@vger.kernel.org>; Thu, 11 Dec 2025 10:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765447961; cv=none; b=IKEy5QK0DITTazVSD0H9MFpdafbm2w+L+olq6sAMUSGjBJmIKBJfhvTJoM1+BH7pmw878AZqTAyCWFIkCcHEkH803FbL3J3NQ91QJ8kpH5ylRlCM1bdn1UnQKEcTe9ck4lCpjz56uJXMmb/JvPYUDIsbKtxp+mfk5yoZzObDeSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765447961; c=relaxed/simple;
	bh=sz0zZ2Lg3ABNrb0OLE8pSBr6LV50bWj3QST7zPt8am0=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=taMBC0z36d0kLb+lTjQU2rewbmX16mnTtdfbKuaITmhtqqIZabcw6WoKFqzdlSMQ47HpWWMe15oepVE5fuH54NUftktpzzrMnKM/0GUo8NR/iD5dMZcbhHMPUldm2rRtvOSxzoja9iNBpSaFRTFe3HCt72sU3GOIoJluWpDOmqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JfxNgHax; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-64979bee42aso1031955a12.0
        for <linux-i2c@vger.kernel.org>; Thu, 11 Dec 2025 02:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765447958; x=1766052758; darn=vger.kernel.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TYOnr5wEhUWJW2W8ImFGIvDe0G51In4Soq5oAWU3228=;
        b=JfxNgHaxcwcAKeyNEAn1O6YaPMmpSZg4JPtqA/+c/gBFHDtGJ1cMrbROX/Nxigf1eN
         gkjL0oWOJ7tuRRK/m1bEXWonEDc42Q8j1WPxtoZEPblums3Lid0blzWB9SnN9wpBgRD6
         8q12rH2etxnPxW0X5F/HEFzCYp75Vbjn5S8xbSyu9pDiUcr5JJeyor4j6Q19QP9YgKDX
         eddRqgARC/vtxB69Jwwl2be4qt0RCAY/OcvKfiSBLKwd5UOze7SQbbr6iy65FBwhG3z2
         6pOYLZAvDM5ZYnUTJMHhjboe1Gsdh+uDdlH9d1zct3CeGScObAWaT2RwZpG8QeIDKXyb
         jAag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765447958; x=1766052758;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TYOnr5wEhUWJW2W8ImFGIvDe0G51In4Soq5oAWU3228=;
        b=Wiy274XN5laKpOHwkCHVruXWHTBxrBEqQ+QeY2PH7QPkcKAlh3XMXTGWjsTsZ/i3Kb
         yl1QEEP7t5EVCJdI4V6pYskeDKx+Qq7i2RZ18EHo5mb375B4UIUCzIzyLFm3bebfVtMo
         ED/R8qImIurw2W1HbV7qX+0dzwEd4XmLdQKrvsaYA6v6YOQgQdgHz7pvrogPHYS4naH6
         ltggCxCbUxsstL141fpTivb0ZM4+OBFRwt4VZhWlGfztETSYmrLurSHVQ3HvsUBX3sZL
         CGBKzVyaZV69EpNctBMSK//YJWh14svCbhqL8SGNo9h0IMt9kc8CHmhcO7SEb0wVzyZY
         WLjw==
X-Forwarded-Encrypted: i=1; AJvYcCWv7SydNv0OWCKnReMyPOk8DJ5zFQts5yMc4Zlmqvp2in2duqQOQi++WR3HjdVBbND7JFA6bqHXPZM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNzNzZCCJRC0PTecU1DWVCNZJ68dN9BJ3Cq9LOQ022Gq1iBm36
	4N9Afmjwu9zOI6NuOQXS6bLOQG2Osjl8IeYsxmqUVFQjJvAIFQHnF+RQtPEk8/FF
X-Gm-Gg: AY/fxX6SqSXvfv3gRpiGOTRQSy4SkIO12Tr7o/LFTM99dNyYm1/l1RmZFquJeb/OYcb
	8Jcrg8h9x+ieZjDI9dps1gzajuPn6rSLbBGsIsUp8kfO/UYAEeihr/j2FzbL4kB9yoVs12HviO5
	hm1JPV1uzXHwJASEB9z+uXC0+X4N56M46wm9xJZeZbP/fCfao/EWbKliflNYY7FreBjxV7An1aL
	4RFJWuAEIybIh7dzD6ZFeXbmSOBoDQM8aqnTJWfWRPkj5HGEf0jWvIq++elim1iXXdLHOFERyJd
	XkyoHnY6ffHrXhOa4DWA/xMP4/Xba6AojMDTpLslUJ582hvWBq+WQXSCvIyVgm4QBb3roGUr6pv
	5UTi4QdolCIvKrNdIoTHE+1ra8RFItGML6Fpq7fd0/amZFoPeZ3+l/aLK1fjJy2xy6rsRNk6oPT
	UYaYGUHZkNQ6gg0ZOO+6s7MNX21HaidoACgfMuy6QBRlnYvLiNiSgH0IKtSiD+uWI9erunjgane
	wtYsXQ=
X-Google-Smtp-Source: AGHT+IFsGZQgjy16TskmJ4FovcbHGQjpz7ia3Np4hwT1tPalw/mBNYgxKIr+zqrmIRmfnaGpd8CmVQ==
X-Received: by 2002:a05:651c:41c8:b0:37b:926d:5bf3 with SMTP id 38308e7fff4ca-37fb1fd8800mr17085641fa.6.1765442092169;
        Thu, 11 Dec 2025 00:34:52 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37fbca944efsm4835301fa.45.2025.12.11.00.34.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Dec 2025 00:34:50 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------xIj9cLUwraQWDWHfqo06yqX7"
Message-ID: <c50c40cc-69f6-436c-a94e-94a3a10f6727@gmail.com>
Date: Thu, 11 Dec 2025 10:34:46 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/29] Revert "treewide: Fix probing of devices in DT
 overlays"
To: Herve Codina <herve.codina@bootlin.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kalle Niemi <kaleposti@gmail.com>, Rob Herring <robh@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Peter Rosin <peda@axentia.se>, Arnd Bergmann <arnd@arndb.de>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Mark Brown <broonie@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Len Brown <lenb@kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Wolfram Sang <wsa@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org,
 Allan Nielsen <allan.nielsen@microchip.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Steen Hegelund <steen.hegelund@microchip.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20251015071420.1173068-1-herve.codina@bootlin.com>
 <20251015071420.1173068-2-herve.codina@bootlin.com>
 <f74ab0a2-b74b-4b96-8469-a716c850e230@gmail.com>
 <CAL_JsqJDOYuzutMHMeFAogd5a_OX6Hwi8Gwz1Vy7HpXgNeYKsg@mail.gmail.com>
 <5cf2a12a-7c66-4622-b4a9-14896c6df005@gmail.com>
 <CAL_JsqJjm12LxpDg6LmpY=Ro_keHwnrWiYMLVnG=s_pSP4X2WQ@mail.gmail.com>
 <072dde7c-a53c-4525-83ac-57ea38edc0b5@gmail.com>
 <CAL_JsqKyG98pXGKpL=gxSc92izpzN7YCdq62ZJByhE6aFYs1fw@mail.gmail.com>
 <55076f4b-d523-4f8c-8bd4-0645b790737e@gmail.com>
 <20251202102619.5cd971cc@bootlin.com>
 <088af3ff-bd04-4bc9-b304-85f6ed555f2a@gmail.com>
 <20251202175836.747593c0@bootlin.com>
 <dc813fc2-28d2-4f2c-a2a3-08e33eec8ec7@gmail.com>
 <20251204083839.4fb8a4b1@bootlin.com>
 <CAMuHMdXdwf7La1EYBWTJadsTAJG3nKQVW6wtBn-bUqshA=XHRw@mail.gmail.com>
 <20251210132140.32dbc3d7@bootlin.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20251210132140.32dbc3d7@bootlin.com>

This is a multi-part message in MIME format.
--------------xIj9cLUwraQWDWHfqo06yqX7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dee Ho peeps,

I tried to create a minimal piece of code/dts to demonstrate the issue 
seem in the ROHM automated testing.

On 10/12/2025 14:21, Herve Codina wrote:
> Hi Geert, Kalle, Rob,
> 
> On Thu, 4 Dec 2025 11:49:13 +0100
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:

//snip

> When a new node is added, a new device is created. Indeed, because the
> driver is an MFD driver, it is a bus driver and handled by of_platform bus.

We do also have an MFD device - but it is not a platform device but an 
I2C device - thus it should be probed by the I2C bus (if I'm not 
mistaken). So, I guess this is not bus-specific problem.
https://elixir.bootlin.com/linux/v6.18/source/drivers/mfd/rohm-bd718x7.c#L206


> My new node is considered by devlink as a node that will have a device ready
> to work (driver attached and device probed). A link is created between this
> node and the consumers of this node (i.e. the SPI controller). devlink is
> waiting for this provider to be ready before allowing the its consumer to probe.
> This node (simple pinmux description) will never lead to a device and devlink
> will never see this "provider" ready.

I believe Kalle did see the same "probe-not-called" -problem, even when 
disabling the fw_devlink from the kernel commandline. (It's worth 
mentioning that I am not sure if Kalle tried if probe was called with 
"previously working" kernels when fw_devlink is disabled).

> Did a test with a Renesas RZ/N1D (r9a06g032) based board and built a similar
> overlay involving I2C controller pinmux, I2C controller and an EEPROM.
> 
> Here, also the overlay didn't work but the issue is different.
> 
> The pinmux definition for pinctrl (i.e. pinctrl subnodes) are looked when
> the pinctrl driver probes. Adding a new node later is not handled by the
> pinctrl driver.
> Applying the overlay leads to a simple:
>    [   16.934168] rzn1-pinctrl 40067000.pinctrl: unable to find group for node /soc/pinctrl@40067000/pins_i2c2
> 
> Indeed, the 'pins_i2c2' has been added by the overlay and was not present
> when the pinctrl probed.
> 
> Tried without adding a new pinmux node (pinctrl subnode) from the overlay
> and used nodes already existing in the base DT.
> 
> On my Marvell Armada 3720 board, it works with or without my patches.
> No regression detected due to my patches.
> 
> On my RZ/N1D board, it works also with or without my patches.
> Here also, no regression detected.
> 
> Also, on my Marvell Armada 3720 board, I can plug my LAN966x PCI board.
> The LAN966x PCI driver used an overlay to describe the LAN966x PCI board.
> 
> With the upstream patch not reverted, i.e. 1a50d9403fb9 ("treewide: Fix
> probing of devices in DT overlays")" applied, devlinks created for the
> LAN966x PCI board internal devices are incorrect and lead to crashes when
> the LAN966x PCI driver is removed due to wrong provider/consumer dependencies.
> 
> When this patch is reverted and replaced by "of: dynamic: Fix overlayed
> devices not probing because of fw_devlink", devlinks created for the LAN966x
> PCI board internal devices are corrects and crashes are no more present on
> removal.
> 
> Kalle, Geert, can you perform a test on your hardware with my patches
> applied and moving your pinmux definition from the overlay to the base
> device-tree?

I got a bit lost regarding which patches to test :)

> The kernel you can use is for instance the kernel at the next-20251127 tag.
> Needed patches for test are present in this kernel:
>      - 76841259ac092 ("of: dynamic: Fix overlayed devices not probing because of fw_devlink")
>      - 7d67ddc5f0148 ("Revert "treewide: Fix probing of devices in DT overlays"")
> 

I did a minimal overlay test which can be ran on beaglebone black. I 
assume the same can be done on any board where you have 
(i2c/spi/xxx)-controller node with status="disabled". Doing this on BBB 
requires recompiling the beaglebone black (base)device-tree with -@ 
though, so that the overlay target nodes are found. I'll attach the 
files for interested.

overlay-test.c:
Is a 'device-driver' for device added in overlay. (simply a probe() with 
print, extracted from the bd71847 driver).

overlay-test.dts:
Is a minimal device-tree overlay describing the 'test device' matching 
above overlay-test driver. When this is overlaid using next-20251121 
(contains the 7d67ddc5f0148b3a03594a45bba5547e92640c89), probe in 
overlay-test.c is not called. When 
7d67ddc5f0148b3a03594a45bba5547e92640c89 is reverted, the probe is called.

mva_overlay.c:
Is simplified 'glue-code' for adding an overlay to running kernel by 
feeding the compiled overlay to the bin_attribute - for example using:

dd if=/overlay-test.dtbo of=/sys/kernel/mva_overlay/overlay_add bs=4M

am335x-boneblack.dtb.dts.tmp and tps65217.dtsi:
are (intermediate) beaglebone-black device-trees which can be recompiled 
to a 'base device-tree' using:

dtc -O dtb -o am335x-boneblack.dtb -b 0 -@ am335x-boneblack.dtb.dts.tmp
  - but I suggest you to use the dts from your kernel build. I provided 
this just for the sake of the completeness.

Makefile:
Off-tree build targets to build the above DTSes and modules. Requires 
KERNEL_DIR and CC to be correctly set.


My findings:
The pinctrl node indeed plays a role. When the "pinctrl-0 = 
<&i2c1_pins>;" (and fragment0) was removed from the dts, the 
'overlay-test' was probed with the "next-20251121".

With the pinctrl node, I see:
[  104.098958] probe of 4802a000.i2c returned -517 (EPROBE_DEFER I 
suppose) after 50 usecs
- and the 'overlay-test' probe is not called.

Yours,
	-- Matti

---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
--------------xIj9cLUwraQWDWHfqo06yqX7
Content-Type: application/x-compressed-tar; name="overlay-test.tgz"
Content-Disposition: attachment; filename="overlay-test.tgz"
Content-Transfer-Encoding: base64

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
/wfnaJ6NAOABAA==

--------------xIj9cLUwraQWDWHfqo06yqX7--


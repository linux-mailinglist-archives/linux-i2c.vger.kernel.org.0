Return-Path: <linux-i2c+bounces-15204-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 050EFD291E8
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 23:52:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52EDC3061161
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 22:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6804629DB6C;
	Thu, 15 Jan 2026 22:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sent.com header.i=@sent.com header.b="we8qD9Mr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ori+gwR3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BE517A2EA;
	Thu, 15 Jan 2026 22:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768517515; cv=none; b=UHNIRDdh2WdsIR0dLAdmumCsrZwj3kg0MgHXms1gsAnmCdvufn4BCdAL5b2/p/yzvbJOlB+i9b7ecGjbrUfKPwRwDnLNfEU6kVIKou1vN3XojhFlA3XOWXLf0Kv16ELo0YK0wHZIeF5MnKu57VcUec0++UsH0PlO1YeQae8cltk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768517515; c=relaxed/simple;
	bh=34p0CLte03VuRGXx1ynlYDW2x+harK8obYHW15AMM70=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=h1X94GPqSuwCTs7f/5V1GMYKreIe6ywHVvLm75rTgYaHM2XwIBfD8vKe3HtBnOEZMeWek151e+6O8YLHUsw69QVrqKOAi/sY0NuEk4ukXjAnyhYy7HxRFKkn4Q5i4VI9MpPr1Eg8i+Zb0dwQbBVet+iOYXLrWWAg1c121QYOObY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sent.com; spf=pass smtp.mailfrom=sent.com; dkim=pass (2048-bit key) header.d=sent.com header.i=@sent.com header.b=we8qD9Mr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ori+gwR3; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sent.com
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 875DF7A007A;
	Thu, 15 Jan 2026 17:51:52 -0500 (EST)
Received: from phl-imap-04 ([10.202.2.82])
  by phl-compute-03.internal (MEProxy); Thu, 15 Jan 2026 17:51:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sent.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1768517512;
	 x=1768603912; bh=tFQBUcSKtb4ViYkQMTkiZRPnWAeej+sfaSTO7aEIQ1I=; b=
	we8qD9MrKzwHL8IFj0dr+jaANCCajyKj1KQCc+y+59dTcwKLeONMhI7/zprXdTJd
	1K6SZp1KxEdD13FUW272NQxBji1hBBA6q8P5RMDk9fQR4SsjpfvGUhN8uFsDP9cH
	pB5DFx2RDhDYE26ZOMxpB4NzHGVxxOSkY7ZSFqeTKVdzymEtCtrQKCMFdGL0F0jC
	2s/P60t128CPj04TOuQsAynXgFY51lhoHFeQQA/haTTW82Ht5BmmY3DmBjMwUY1z
	JQuBDk+RzIdtbjO/0vp+juZLSzfVqdL3LTyzjBKl4vfHfvlNuX+mcgovKIrFIe2q
	xvrwYgw4U4HDvFoOP8EoUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1768517512; x=
	1768603912; bh=tFQBUcSKtb4ViYkQMTkiZRPnWAeej+sfaSTO7aEIQ1I=; b=o
	ri+gwR34h9L4uMV3DgZpNr+4C4/cOcLXYHOSKlGTXY+p9Tl80a4tTB1ZSI40Ccwx
	FaKUHo2pTJjA6EG23jPIYlP1phS6hb/TZJ9Bsl6FwpcFcth3QhGdvh1LqiFt4CFe
	yySQLCAkOg3uxKsAJX3I9ccj3y3PleVzM3aAdIMp8tQtnC6bOY36HLK/ryNPh2jG
	XeWImov5BVdyo8V+AxLUQOhNDJdJAK7YBDC7bnHXfq3idgg8nInWA+7WhlQo8tWH
	agE8PXFstnZfmjJkKkBYfxXOXkM2+O+EzlzRimvNL+DoUIKUk4PpY9BfNXswqIfL
	YE7V/ix3TXkvmOczxn3XQ==
X-ME-Sender: <xms:h29paXv8fmmaFwTYr9W00TUyAIL9GMlkX5-Bd2E3pvMvYSh-5VfCeg>
    <xme:h29paTTW2kjhAiAKnZdNYh0SG1YHE_cnlrhhSSBtCz36YPASTSRNbWktDFDR6leRy
    fOBALqlkiRfy1HXkGgTIX-bk4eXjCMJSvQucELnfAdjfbJovfZlF1g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvdejfedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpegtohhrrhgv
    tghtmhhoshhtuceotghmlhhishhtshesshgvnhhtrdgtohhmqeenucggtffrrghtthgvrh
    hnpeejgfdvteelffdvveeuffegtdehtddvjeekfeeukeduleekheekheekleeuheeiveen
    ucffohhmrghinhepmhgrnhhjrghrohdrohhrghdptggrtghhhihoshdrohhrghdprghrtg
    hhlhhinhhugidrohhrghdpkhgvrhhnvghlrdhorhhgpdgrlhhtlhhinhhugidrohhrghen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegtmhhlih
    hsthhssehsvghnthdrtghomhdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphho
    uhhtpdhrtghpthhtohepvhhkohhulheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprg
    hnughrihihrdhshhgvvhgthhgvnhhkoheslhhinhhugidrihhnthgvlhdrtghomhdprhgt
    phhtthhopehmihhkrgdrfigvshhtvghrsggvrhhgsehlihhnuhigrdhinhhtvghlrdgtoh
    hmpdhrtghpthhtoheprhgvghhrvghsshhiohhnsheslhhishhtshdrlhhinhhugidruggv
    vhdprhgtphhtthhopegumhgrvghnghhinhgvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:h29paRUN9_Scnl2PhQqzvONrLQw7jz3TI-k4a2Rfy3So5457YbFvpA>
    <xmx:h29pabrPmtquPDx7paje-mgM4PfJVxCB7Nnp19kQ89QGcq50UzLaQw>
    <xmx:h29padTp3WkVJ04QdAye7nZcV3jCJoq4rcOprMYpTLO7E35IlsLVXw>
    <xmx:h29paV0CammP3GOlfcA76AiQ1OBBX58ztslGypBg_Bg_UDjSEphQLA>
    <xmx:iG9paXHKEJVtwuDFXF-eZxV6AdyvD7Enm5aL1jVUbQ-0O6TqHo3bntyO>
Feedback-ID: i87314915:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C4C2CB6006E; Thu, 15 Jan 2026 17:51:51 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AwebR64VcaZc
Date: Thu, 15 Jan 2026 17:50:36 -0500
From: correctmost <cmlists@sent.com>
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Cc: dmaengine@vger.kernel.org, regressions@lists.linux.dev, vkoul@kernel.org,
 linux-i2c@vger.kernel.org, mika.westerberg@linux.intel.com
Message-Id: <69f5dea3-17b0-4d3a-9de7-eb54f8f0f5cd@app.fastmail.com>
In-Reply-To: <aWUGmfcjWpFJs3-X@smile.fi.intel.com>
References: <51388859-bf5f-484c-9937-8f6883393b4d@app.fastmail.com>
 <aWUGmfcjWpFJs3-X@smile.fi.intel.com>
Subject: Re: [REGRESSION][BISECTED] Lenovo IdeaPad touchpad does not work when idma64
 is present in initramfs
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026, at 9:35 AM, Andy Shevchenko wrote:
> On Tue, Dec 16, 2025 at 12:57:10PM -0500, correctmost wrote:
>
>> The following commit
>
> No, it's false positive. The reality is that something else is going on
> there on this and other similar laptops.
>
>> causes my Lenovo IdeaPad touchpad not to work when
>> kernel/drivers/dma/idma64.ko.zst is present in the initramfs image:
>>=20
>> #regzbot introduced: 9140ce47872bfd89fca888c2f992faa51d20c2bc
>>=20
>> "idma64: Don't try to serve interrupts when device is powered off"
>
> So, the touchpad is an I=C2=B2C device, which is connected to an Intel=
 SoC.
> The I=C2=B2C host controller is Synopsys DesignWare. On Intel SoCs the=
 above
> mentioned IP is generated with private DMA engine, that's called Intel
> iDMA 64-bit. Basically it's two devices under a single PCI hood.
> The problem here is that when PCI device is in D3, both devices are
> powered off, but something sends an interrupt and it's not recognized
> being the one, send by a device (touchpad).
>
> There is one of the following potential issues (or their combinations):
>
> - the I=C2=B2C host controller hardware got off too early
> - the line is shared with something else that generates interrupt storm
> - the BIOS does weird (wrong) things at a boot time, like not properly
>   shutting down and disabling interrupt sources; also may have wrong
>   pin control settings
> - the touchpad is operating on higher frequency like 400kHz (because
>   BIOS told to use that one instead of 100kHz) than the HW is designed
>   for and hence unreliable with all possible side effects
> - the touchpad firmware behaves wrongly on some sequences (see also
>   note about the bus speed above), try to upgrade touchpad FW
>
> With my experience with the case of the above mentioned commit that it
> may be BIOS thingy. Also consider the bus speed, there are quirks in
> the kernel for that.

Thank you for the detailed notes.  I will see if I can update my BIOS an=
d experiment with different quirks values, though I won't be able to do =
that until late next week.

>
>> Here are the related logs:
>>=20
>> ---
>>=20
>> irq 27: nobody cared (try booting with the "irqpoll" option)
>
> Almost all below is not so interesting.
>
> ...
>
>> handlers:
>> [<00000000104a7621>] idma64_irq [idma64]
>> [<00000000bd8d08e9>] i2c_dw_isr
>> Disabling IRQ #27
>
> Yes, this line at least shared between those two and might be more.
>
> ...
>
>> i2c_designware i2c_designware.0: controller timed out
>> hid (null): reading report descriptor failed
>> i2c_hid_acpi i2c-ELAN06FA:00: can't add hid device: -110
>> i2c_hid_acpi i2c-ELAN06FA:00: probe with driver i2c_hid_acpi failed w=
ith error -110
>
> Yes, sounds familiar with the speed settings. Try to down it to 100kHz=
 in case
> it's confirmed to be 400kHz.
>
>> ---
>>=20
>> Hardware info:
>> - Lenovo 16" IdeaPad Slim 5 - 16IRU9
>>   - Hardware name: LENOVO 83FW/LNVNB161216, BIOS PFCN14WW 09/20/2024
>>   - ELAN06FA:00 04F3:327E Touchpad
>>=20
>> Steps to reproduce:
>> - Cold boot the laptop on Arch Linux
>>=20
>> The bug is still present with the 6.19.0-rc1-1-git kernel.
>>=20
>> The bisected commit is from March 2024, but I only recently noticed t=
he issue
>> because the initramfs images on Arch Linux now include these addition=
al
>> drivers (as of November 2025):
>> - kernel/drivers/dma/idma64.ko.zst
>> - kernel/drivers/mfd/intel-lpss-pci.ko.zst
>> - kernel/drivers/mfd/intel-lpss.ko.zst
>>=20
>> Two other users have reported the issue on the Arch Linux and CachyOS=
 forums,
>
> Any pointers to that thread, please?
>

The following threads have users who were able to restore touchpad funct=
ionality by undoing the idma64 change in initramfs:

- https://forum.manjaro.org/t/lenovo-thinkbook-14-g4-iap-touchpad-not-wo=
rking/184156
  - Lenovo Thinkbook 14 G4 IAP
  - i2c-SYNA2BA6:00

- https://discuss.cachyos.org/t/syna3602-touchpad-completely-undetected-=
after-update/20461
  - AVITA AM15A2IN
  - SYNA3602

- https://bbs.archlinux.org/viewtopic.php?pid=3D2277786#p2277786
  - MSI Modern 15 F13MG-074IT

- https://bbs.archlinux.org/viewtopic.php?id=3D310946
  - Lenovo IdeaPad Slim 5i

- https://discuss.cachyos.org/t/touchpad-not-working-after-linux-6-16-7-=
update/18348/6
  - Unspecified laptop model

The following bug reports also seem related because they mention the "pr=
obe with driver i2c_hid_acpi failed with error -110" message:

- https://bugzilla.kernel.org/show_bug.cgi?id=3D220783
  - Casper Nirvana C650
  - SYNA3602:00 093A:0255

- https://lore.kernel.org/regressions/2c8d4baa-679f-4af7-a78d-41774410e9=
a6@leemhuis.info/T/
  - Infinix Y4 Max
  - SYNA3602:00 093A:35ED (I2C HID)

Lastly, I saw another bug report that mentions the "probe with driver i2=
c_hid_acpi failed with error -110" error.  It seems to state that the er=
ror only occurs when a power cable is connected during boot:

- https://bugzilla.altlinux.org/57094
  - Huawei Matebook D15 BOD-WXX9-PCB-B4
  - i2c-GXTP7863:00

>> so I don't think this is a hardware issue with my individual laptop.
>
> I don't know how this conclusion is came here. You mean HW as laptop m=
odel?
> But are the involved components the same (I=C2=B2C host controller + t=
ouchpad)?

Sorry for the confusion.  I meant the individual machine in my possessio=
n and not the laptop model as a whole.

>
> --=20
> With Best Regards,
> Andy Shevchenko

Thank you!


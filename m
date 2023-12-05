Return-Path: <linux-i2c+bounces-620-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 749DB805020
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Dec 2023 11:23:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E136FB20D9A
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Dec 2023 10:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 175814F216;
	Tue,  5 Dec 2023 10:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OYuCQ8kw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B54790;
	Tue,  5 Dec 2023 02:22:53 -0800 (PST)
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C34556602F1E;
	Tue,  5 Dec 2023 10:22:49 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701771771;
	bh=3U+2S6yFT5IinHlDHOnGowPBFs7ClJzaLOhopmK8tJk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OYuCQ8kwdLnWkv1MfHToaXZ587QswHOutjKlfKfVYjCnU/s92pr8c3o9SnFkhf9BG
	 Ji4lDYcYURVmRno7WIM+Ij42lFOpJD6ckjLuX6BZkwXXXUZ7cM5ErLHx/gOOJ3zwRR
	 lLAdVr5MwcRSd96WdScV8w+5+I8XbztbTAMbi9Qlgou0pRMfrT50bHtA66RFzozoSI
	 1TwY5RvAbJBq78cU+3pbZR+kXl2hc3VhM6d9tly282icyqWUOqGDNRUKOPZhQzer3u
	 gftavexdPt6RBGhr1ej4AKrch5TdmIjafkGQ2o6HvEUgPjXiD2JNSK5Ydr5172HmNn
	 7unW/WF969rzw==
Message-ID: <3700f05f-2411-4422-972f-f3df690efb84@collabora.com>
Date: Tue, 5 Dec 2023 11:22:46 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 4/5] arm64: dts: mediatek: mt8173-elm-hana: Mark
 touchscreens and trackpads as fail
To: Doug Anderson <dianders@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Wolfram Sang <wsa@kernel.org>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 andriy.shevchenko@linux.intel.com, Jiri Kosina <jikos@kernel.org>,
 linus.walleij@linaro.org, broonie@kernel.org, gregkh@linuxfoundation.org,
 hdegoede@redhat.com, james.clark@arm.com, james@equiv.tech,
 keescook@chromium.org, rafael@kernel.org, tglx@linutronix.de,
 Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org,
 linux-i2c@vger.kernel.org
References: <20231128084236.157152-1-wenst@chromium.org>
 <20231128084236.157152-5-wenst@chromium.org>
 <CAD=FV=W01gfxV6RN2o6CVS7jjf8qgKP-jUy9Bp94d2hWzVC48A@mail.gmail.com>
 <CAGXv+5E+R292XsOFSL-j0KJMmVJjWtxMRgCK8besP7mo6NDOWA@mail.gmail.com>
 <CAD=FV=UQkAjgMuR85cPikNtCxsODWPWs7cibOcOoNGdjSSvF8Q@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAD=FV=UQkAjgMuR85cPikNtCxsODWPWs7cibOcOoNGdjSSvF8Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 04/12/23 17:50, Doug Anderson ha scritto:
> Hi,
> 
> On Sun, Dec 3, 2023 at 10:59 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>>
>> On Sat, Dec 2, 2023 at 8:58 AM Doug Anderson <dianders@chromium.org> wrote:
>>>
>>> Hi,
>>>
>>> On Tue, Nov 28, 2023 at 12:45 AM Chen-Yu Tsai <wenst@chromium.org> wrote:
>>>>
>>>> @@ -44,6 +46,7 @@ trackpad2: trackpad@2c {
>>>>                  reg = <0x2c>;
>>>>                  hid-descr-addr = <0x0020>;
>>>>                  wakeup-source;
>>>> +               status = "fail-needs-probe";
>>>
>>> While doing this, you could also remove the hack where the trackpad
>>> IRQ pinctrl is listed under i2c4.
>>
>> Sure. I do think we can do away with it though. According to at least one
>> schematic, the interrupt line has pull-ups on both sides of the voltage
>> shifter.
>>
>> BTW, The touchscreen doesn't have pinctrl entries. This has pull-ups on
>> both sides of the voltage shifter as well.
> 
> I dunno if the convention is different on Mediatek boards, but at
> least on boards I've been involved with in the past we've always put
> pinctrl entries just to make things explicit. This meant that we
> didn't rely on the firmware/bootrom/defaults to leave pulls in any
> particular state. ...otherwise those external pull-ups could be
> fighting with internal pull-downs, right?
> 

MediaTek boards aren't special and there's no good reason for those to rely on
firmware/bootrom/defaults - so there is no good reason to avoid declaring any
relevant pinctrl entry.

Cheers,
Angelo



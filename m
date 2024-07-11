Return-Path: <linux-i2c+bounces-4900-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A9792E43B
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 12:09:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC34B28939D
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 10:09:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58398158D6D;
	Thu, 11 Jul 2024 10:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="Dg4rsamN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E4A15887C;
	Thu, 11 Jul 2024 10:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720692546; cv=none; b=OWpZfVynt61C7/WjfeqjYRIWT1gJ1XbPxCEiUEZzD74CVCT1Eg1RZJTkOsy8XjF2pGRrNOYST/nArKSVP+73AQ9LyAHP+xUqhsPZNT3NR+168SBHNsCbg+Q5zi+pTt8Z/wNepHYhVWR2SApoyjVm0tMy7FcG18i3MzP0Lvn4VFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720692546; c=relaxed/simple;
	bh=TogIIJJ02n4A4hy8KVS94EmFlJNRJHgab8Y06q/j4oA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AbQBxvYZE4m4URkATuOFZtXZY7WR8OT3c/Y741zYjzh+gsafDYqyrcG1acityrPB7h6fBmM6MBLSPmXpx6RNrkwoNlXqfGYWBjgaie+imCpRbpaaPrVsx9mdB6EUyifZgUqNVxedIcGCxl0hs/7CR4UvvKCSv9rMW1tt1it0JLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=Dg4rsamN; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1720692528; x=1721297328; i=deller@gmx.de;
	bh=aeQ7MBI4uXNPRP9dfKZtJzB8V93jNRcQsBz9aaIg6tU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Dg4rsamN3w7DvlQh8zy1Tq2lAKCeA1Ho78V+OWibX70yJ3qh5JmH26AX8v3ybczf
	 pg+Dii7dnC3Lcsk1r/30k8/XTlBUi++NKwVBgTJVWJ1mFrK8ZdRj82eEtatcYrIM8
	 AjB4ug2PZ2LA7RlMdnNvPz9Mq0a9hNieY9IrQosGFwrXxf32gKa/eZ3ZJ6fSFobRM
	 07X4P9dl42KM5og0UGZQVPpw9w/JT8umdGUcoapXN28c9i+VMFfpVqe1qtx7jJKYe
	 nr3XfTpaflN5dEgVcMRZiHu1+vsw6Jm2Gq6ET/kBBPuORvbg45bQkwA9igWZeX1Qe
	 AqgKi0ptT+ZVx6b10g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.8.0.6] ([78.94.87.245]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MqJqD-1s4rtz1NtD-00eH7h; Thu, 11
 Jul 2024 12:08:48 +0200
Message-ID: <4de25766-fe4e-4044-9233-cb54953d6d66@gmx.de>
Date: Thu, 11 Jul 2024 12:08:46 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] fbdev/smscufx: Make I2C terminology more inclusive
To: Easwar Hariharan <eahariha@linux.microsoft.com>,
 Steve Glendinning <steve.glendinning@shawell.net>,
 "open list:SMSC UFX6000 and UFX7000 USB to VGA DRIVER"
 <linux-fbdev@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20240711052734.1273652-1-eahariha@linux.microsoft.com>
 <20240711052734.1273652-6-eahariha@linux.microsoft.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20240711052734.1273652-6-eahariha@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:yguAnix3/rhAY9NbLXw9SbRVg0yIKZAv4hBgIl/ZY6P7oPAFvH8
 G67kkYtgZ9IPrLi6H+Z85Bgf3q6F6PdH1MtMx8rTK2+ivnckchJCMoSNXEZIzlCvpbp6Qhq
 3x7mOjXGWG2ZfdQcqs98NMpDmOhOuBtttJz631cTgBoosv9X+ogefQgFvyrg27xAS/DqG0O
 xLJW75wNO74VckYuzk7WA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5C30+QJnVNo=;lMkz9KKPOrhieJWtIaSoTvrp75/
 xzi787kv6Chx6e9ZZTXnZ9TJF3PrDacfa1mKly48yJIeQg1TNp+Y7pHVXZIA8J7xrjFTt6YXf
 9Ley5sbCOzuMctlSVVICH5XSWewoG9ONfqovOHyUg/5XljQy1yvy0Ybce3lxXp06KT8ZCKKs1
 e5QER056WR1ZzXS94hgVsujOZivRKyZGzJZyrTdSPO/Ir5JG7Y6vrp3emBPyiv9alfanXPAWT
 KQA6rj9/ClxLyYaFdMjlPw1U3Ui/L2PGViUBIa18Xr1Q4k7DMg85jqoC/xKvZOeKpap8AqEtp
 3hJuPTlSqWRV/gIJPd/uTr3onw3AGg6IXTK6cTz6hc248E35GnKyT+1SDgVeWIgxXCkFTtikU
 VSb7ItGPUh60yUwDPsIkGI4VY2kO28DES/6uYqw7N8BmG3na81hchCDf3GfuWd+JEgBfVPOQW
 iQn9mKnovrDqSBPXcq64uilccWaL3IMt/7kQgk0J503zMMSLf79awVnaTnezFY1LUjGDkJgPL
 spYKpSjLOloqZU4vfTM0GOx520AUjYwdLlfEmxqo64tE9S6lcvB1YNQDOnmMTJwUSLN120DOX
 swUOP6O9a3yX0yvvNNVVlAwlbu0NZaVaBn9ge2MmRLpxwEMFrxlBG0ZQGZFiluZdKfToAj+F8
 NXNKoKCaDepS2fsM59j1EjOwqCPvXMzwk+2DV9Rwflwp3XlMDh4x9qJiwf4uB/P6NJsvQKYAY
 CotozCCAZCIXwej/Yguak0ubXsfCYSckHXBSgb7qbbzxExIlpavbncdHng3/5y+ufHMD3N9Yr
 9OgmAbbnWZBt9P4n0v3HEAWw==

On 7/11/24 07:27, Easwar Hariharan wrote:
> I2C v7, SMBus 3.2, and I3C 1.1.1 specifications have replaced "master/sl=
ave"
> with more appropriate terms. Inspired by Wolfram's series to fix drivers=
/i2c/,
> fix the terminology for users of I2C_ALGOBIT bitbanging interface, now t=
hat
> the approved verbiage exists in the specification.
>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> ---
>   drivers/video/fbdev/smscufx.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

applied this patch to fbdev git tree.

Thanks!
Helge



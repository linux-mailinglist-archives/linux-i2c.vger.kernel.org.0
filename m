Return-Path: <linux-i2c+bounces-13944-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FA3C29460
	for <lists+linux-i2c@lfdr.de>; Sun, 02 Nov 2025 19:00:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B421188DAD0
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Nov 2025 18:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9AA18FDBD;
	Sun,  2 Nov 2025 18:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="NF9BT8Bs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mxout3.routing.net (mxout3.routing.net [134.0.28.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3A170814
	for <linux-i2c@vger.kernel.org>; Sun,  2 Nov 2025 18:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762106430; cv=none; b=ul4KpglqNI+Yo8ry3FONvAOk029wc+C6mcEadBnmU/SXQO5dQKlMZRos+SX8lH614g2p3OL0n52iRlBUs2nMh+jZpbvAWEXw/LNh+1HiTjf1F3QkEi2oenPvtWXK1r475uDKepWVYDUz0BPVPtj1IDrNKRUuoI4MjvDdtPv7CUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762106430; c=relaxed/simple;
	bh=zgBaCyA95CkCdyVtikVePSEbwr2ylWzkrJylVaeygJM=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=dGv3x5DNDI68xKeBlNsV+n/u3XVDx5siDyvJzKlaSYqAynSO5nNz/fig00yUM1Nw8kTs4acyOpGbkSmUlFK6MYsPwfI1q5c4GgMN8pBhh5devLGRioq7t+sE62sLbBSkDm5tBevHo2OUWjz5CaNMW69WgF/V6k6DH7f4aXeTWhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=NF9BT8Bs; arc=none smtp.client-ip=134.0.28.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout3.routing.net (Postfix) with ESMTP id 00BD86010F;
	Sun,  2 Nov 2025 18:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1762106420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XCdxwgvfLLmISGJYvdvJUkKzM2T1HKuVbOCvYfSZJ8Q=;
	b=NF9BT8BswEY19Ex/H9Jh2/o1Sv3oXdMuBqMZygyeQUNEeWKx9BjaSwJURPKTs5V4dvWKCv
	IXJAHz0e08ACesdV7SweQB1xBGFYUIoqTaLtwYmR0a2idG6xxvbwfBZI0ir4ouggJbC1IW
	7j3wMnPcPUpLTz+0adgkxrH/YbhXfWI=
Received: from webmail.hosting.de (unknown [134.0.26.148])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 60E9F1005EC;
	Sun,  2 Nov 2025 18:00:19 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 02 Nov 2025 19:00:19 +0100
From: "Frank Wunderlich (linux)" <linux@fw-web.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: angelogioacchino.delregno@collabora.com, matthias.bgg@kernel.org, Andi
 Shyti <andi.shyti@kernel.org>, Qii Wang <qii.wang@mediatek.com>, Wojciech
 Siudy <wojciech.siudy@nokia.com>, linux-mediatek@lists.infradead.org,
 linux-i2c@vger.kernel.org, daniel@makrotopia.org
Subject: Re: i2c issues in 6.18 on R4, but not r4pro (both mt7988 with i2c-mux
 on i2c2)
In-Reply-To: <aQdSVcazPQl-shR6@shikoro>
References: <3f5ef2d1336933a87d9761b5ff510a1f@fw-web.de>
 <64fb54d5f2bc929720d3313f7fa2d8cd@fw-web.de> <aQdSVcazPQl-shR6@shikoro>
Message-ID: <1144f62ad9886fed60620bce0bbed7ee@fw-web.de>
X-Sender: linux@fw-web.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mail-ID: f37694be-ee31-4dbf-ac46-b50d472b364f

Am 2025-11-02 13:45, schrieb Wolfram Sang:
> Can you try enabling CONFIG_RESET_GPIO please? It is probably that this
> driver is missing. The core relies on that driver for the fallback the
> above patch makes use of. Sadly, I couldn't convince the reset
> maintainers of a way to automatically select the driver for existing
> users :(

Thanks for pointing to this and indeed i had not enabled this. This is 
my fault and not
from reset maintainers as i have my own defconfig. Tested and my mux 
works now again.

Maybe this option should be enabled by default or when the i2c-mux is 
selected?

When moving from specific to a generic aproach (which makes sense) imho 
it should be
mentioned in commit description which option needed instead :)

btw. the Authors Email seems not working, got

<wojciech.siudy@nokia.com>: host
     nokia-com.mail.protection.outlook.com[52.101.73.24] said: 550 5.4.1
     Recipient address rejected: Access denied.

or maybe its inbox has a whitelist from which domains he can receive 
mails and my
domain is not added to it.

regards Frank


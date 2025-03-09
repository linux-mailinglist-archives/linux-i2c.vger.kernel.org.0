Return-Path: <linux-i2c+bounces-9761-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAE0A58735
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Mar 2025 19:23:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E97AB1677BF
	for <lists+linux-i2c@lfdr.de>; Sun,  9 Mar 2025 18:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 844DD4683;
	Sun,  9 Mar 2025 18:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="mUjSMxiq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA1D1EF39B
	for <linux-i2c@vger.kernel.org>; Sun,  9 Mar 2025 18:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741544625; cv=none; b=MIE2hfUfgNKvk6ATQ+r+NC6+Ev9cGaS2vqFODpn12oPE1zXIYO/RX9ncrCnM7M5WyrUZPkpSxIk0lqdOhyiKFW+DJnfrEzxUTD5ECpVbCwizuamoJ6FiQfsiEDd3Qgih4HiLP41UFBx43ceBfYFTkcrBcDPPFv7XxLkrHz6N7/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741544625; c=relaxed/simple;
	bh=8Q7sl7SWDPeMdadS7RKEQ5Zh375kbNERL8UHvLuI61o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=erafVxRJRkQEPH8lB8XnqE152J1w25gEkxogFRhnbMeTQS70bt0PNCJ2Dui8NIEtqDB+SKvD5N0YSBfd5o01zE5jGgBFnM2hc9ygNaz46L0Ru1+5mRxV0L+j+yJoxJS3YwNfu23Tqze0wNbYvCk5S13xreip/wzleU7/7Z69awo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=mUjSMxiq; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1741544616;
 bh=QvnfGlC40UQmnKcl5OF0pRINHPgf7NC49WGBsWl3pAM=;
 b=mUjSMxiqPdCTwLtfP9Tq059DBC1ERQ2WdVsAe+EbV5rkAesqFr5wpZtr7MbBeHCENyWQ2yGJ5
 xG1U5li8eeDHRVxeDrFd0uYV5lreP+vZiScM38oLulvXlD4/XxOGnVSk0xicfsc1Ut2allNl1zN
 S5x0dKeT1SsRE+YZVeJPbNAJtUcxf5uauha/rapyT2PvklyziKPlMEVXnLw1/NwTuI5FBMuF51g
 b2ajs2uzlpD8nn9hRqJVnwGYgDAqelpiH++X6LO6vlyNlJXJaF3jW+Aiq5fe0bEqCTy/oaxESNH
 s6rVjFkqHn9drmHaXjTmnihwWssoQrsAiHRV/P5dDngg==
X-Forward-Email-ID: 67cddc968d04fc44bbac47b6
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <0b679284-d427-4229-b008-e3e466f66a0f@kwiboo.se>
Date: Sun, 9 Mar 2025 19:23:12 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: rockchip: Add I2C controllers for RK3528
To: Yao Zi <ziyao@disroot.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chukun Pan <amadeus@jmu.edu.cn>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250309070603.35254-1-ziyao@disroot.org>
 <20250309070603.35254-3-ziyao@disroot.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250309070603.35254-3-ziyao@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Yao Zi,

On 2025-03-09 08:06, Yao Zi wrote:
> Describe I2C controllers shipped by RK3528 in devicetree.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  arch/arm64/boot/dts/rockchip/rk3528.dtsi | 104 +++++++++++++++++++++++
>  1 file changed, 104 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> index 04ca2e2b3e9b..860b6057e5c2 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> @@ -19,6 +19,14 @@ / {
>  	#size-cells = <2>;
>  
>  	aliases {
> +		i2c0 = &i2c0;
> +		i2c1 = &i2c1;
> +		i2c2 = &i2c2;
> +		i2c3 = &i2c3;
> +		i2c4 = &i2c4;
> +		i2c5 = &i2c5;
> +		i2c6 = &i2c6;
> +		i2c7 = &i2c7;

nitpick: These should be ordered after the gpioX aliases.

Regards,
Jonas

>  		gpio0 = &gpio0;
>  		gpio1 = &gpio1;
>  		gpio2 = &gpio2;

[snip]


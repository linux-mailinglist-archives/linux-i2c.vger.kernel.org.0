Return-Path: <linux-i2c+bounces-4745-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6D09299C0
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Jul 2024 22:53:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D08528157F
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Jul 2024 20:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 886CD224E8;
	Sun,  7 Jul 2024 20:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="I4An6qMp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C8310A0A
	for <linux-i2c@vger.kernel.org>; Sun,  7 Jul 2024 20:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720385584; cv=none; b=JHSJY4TklJgB9lgRc9IJIluARW7Iqy8JfUdaBBlR1iECy28snAez9+InVJCeCwVHHT4Yp1/1y9yHol7ZZcQndeH0FeI2Fc/3p2B8RHQBZ6EmuYHp72s6/eD6Iky478IcdMGMa0Z1oE7arI6nkahWABvEXiVyOHKzja2WJQ7JckU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720385584; c=relaxed/simple;
	bh=O7KHGy1PwJlcyxV54F1tDTKtP0jJwbyzO33OsAmWVFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MIurJv1Lca/6aklU8pn84mEevM53lzg2aeGNseQ1UvPuy1sf0PEuU+g0f3+65nnHI/4m2vHvdlpuV69baXRzfUWFK55EoPTKfNrmgulkChwDzv+i/wKVGEpNpVOKYLz7QML+q1I9q6Iy2MzLxtd1chwpYqsRp880ZABRDTyS7uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=I4An6qMp; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id A3B0C2C0433;
	Mon,  8 Jul 2024 08:52:52 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1720385572;
	bh=skr3URZTIgEhjBQlwqutJHgPbyrNK9VQr2qDmwrcfKU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I4An6qMpsYkMVQSTXVJPprzrKOEORSXyfbzTVojh0DYl5rc0oyKvbyXA6I3F6lLmY
	 G0QqjczzML/Nj5BhRQ9A9WPDHxDREXAY0AQQ7kOrXdl2H1ODo0VNLmvSYmaNo5JvqJ
	 V5OITAyyjhDBiGv+nfqTQu02b3pJJThYuEgRgRjJpPstKzEuW+9rWDHediAitTmR6n
	 3dLZH1Oko9+ey1oGRBjUIE65+3q+UFxyiyf3UCOwI1YCJenOMmuk4gYXXMjGlKx6oR
	 8YfHq8HxqUOmxF6FdLto17KCzRUCS03bZrwKTtP1fvPmyIN9OGvqzvO0mlcf48IGJr
	 VpGP/DkMBMBLw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B668b00240000>; Mon, 08 Jul 2024 08:52:52 +1200
Received: from [10.33.22.30] (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 8176413EE2B;
	Mon,  8 Jul 2024 08:52:52 +1200 (NZST)
Message-ID: <9c62dc0b-69cc-4a16-9de9-51f5226bfae3@alliedtelesis.co.nz>
Date: Mon, 8 Jul 2024 08:52:52 +1200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 30/60] i2c: mpc: reword according to newest
 specification
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-31-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20240706112116.24543-31-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=668b0024 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=4kmOji7k6h8A:10 a=LDBv8-xUAAAA:8 a=jHE0U7SLfm1NBUObjNkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=DZeXCJrVpAJBw65Qk4Ds:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat


On 6/07/24 23:20, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>   drivers/i2c/busses/i2c-mpc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
> index c4223556b3b8..41d6c8ed163a 100644
> --- a/drivers/i2c/busses/i2c-mpc.c
> +++ b/drivers/i2c/busses/i2c-mpc.c
> @@ -115,7 +115,7 @@ static inline void writeccr(struct mpc_i2c *i2c, u32 x)
>   	writeb(x, i2c->base + MPC_I2C_CR);
>   }
>   
> -/* Sometimes 9th clock pulse isn't generated, and slave doesn't release
> +/* Sometimes 9th clock pulse isn't generated, and target doesn't release
>    * the bus, because it wants to send ACK.
>    * Following sequence of enabling/disabling and sending start/stop generates
>    * the 9 pulses, each with a START then ending with STOP, so it's all OK.
> @@ -759,7 +759,7 @@ static int fsl_i2c_bus_recovery(struct i2c_adapter *adap)
>   }
>   
>   static const struct i2c_algorithm mpc_algo = {
> -	.master_xfer = mpc_xfer,
> +	.xfer = mpc_xfer,
>   	.functionality = mpc_functionality,
>   };
>   


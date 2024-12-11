Return-Path: <linux-i2c+bounces-8450-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DED359ECAF5
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 12:20:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02008285097
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 11:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDE9E1C5CD6;
	Wed, 11 Dec 2024 11:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dBQKwEZo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BA9187872;
	Wed, 11 Dec 2024 11:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733916020; cv=none; b=E2+flM5AbmP+3YGlBPZ3wg9VRPmbwROq6sbwqdFMGDDJ7w8QUFca+g6MrVl4mSwNUG0jh6ThV8DNAns6q1PTwuXTL5Jy2T55fakp0Io36+6hiAiO+PDFH7xG2m3rdY3foMUBJH+ceAkfyTIRsz2VKdH0pzA/uz17SBD1nx4y9xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733916020; c=relaxed/simple;
	bh=W5sH/BUvR3Vg2JFLycXph7Qauev5/AAKrJsrnlwUCso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qMI7ZsbOjJ8HBJVoiaI09vimHmV7aLt35NNJILMJ4zW3C/jNXkl/D3c5NjcvWl6fCQ1dt00ErJr3fFMnIRTi50YloRjdMpc0008UTRrUFSY1w/YWdvgnPkV1quUA0fHztUE0Ta1+q2DuGF80EfeIdLwPCPz3PAycGICY1eT/Eps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dBQKwEZo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AC62C4CED2;
	Wed, 11 Dec 2024 11:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733916020;
	bh=W5sH/BUvR3Vg2JFLycXph7Qauev5/AAKrJsrnlwUCso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dBQKwEZorV1rWaXhfZgkpXWc5vio0gv0T49rLoCqiE22UyoukxSf3GRTULRtvgb9G
	 xlwPpV6bIWOn4ibx1zBDCTRc/Is1DyqrsP2Ns4ASXYpmKhrspunM2r77/N0cb2ZZzb
	 LWW31BPBNDgt1eZvd8i8dVfue7CChl0eLkDfNGe+Sd2a/YGsGgmEh0hMJqm0XG2wH2
	 Thu/NtZCVtPD0781h3bTX5S2cYB+UOECMxNE+Jonj/p9LgnQJWhjm8j3Hb/FfUILvW
	 sxK9d0adpDAlS3807l0QmyRsNZZwr0t3RREvZsO8K6nxsREydw4EAtFfACus8ydNi7
	 gNLcwjLNQBTzA==
Date: Wed, 11 Dec 2024 12:20:15 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Chris Brandt <chris.brandt@renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Adam Ford <aford173@gmail.com>, linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: riic: Always round-up when calculating bus period
Message-ID: <ljyho2ftsxmjkyi44hgc5zavxv3ytbvi2iuoht3gjetr3b4jq3@mjuvcrwm4klt>
References: <c59aea77998dfea1b4456c4b33b55ab216fcbf5e.1732284746.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c59aea77998dfea1b4456c4b33b55ab216fcbf5e.1732284746.git.geert+renesas@glider.be>

On Fri, Nov 22, 2024 at 03:14:35PM +0100, Geert Uytterhoeven wrote:
> Currently, the RIIC driver may run the I2C bus faster than requested,
> which may cause subtle failures.  E.g. Biju reported a measured bus
> speed of 450 kHz instead of the expected maximum of 400 kHz on RZ/G2L.
> 
> The initial calculation of the bus period uses DIV_ROUND_UP(), to make
> sure the actual bus speed never becomes faster than the requested bus
> speed.  However, the subsequent division-by-two steps do not use
> round-up, which may lead to a too-small period, hence a too-fast and
> possible out-of-spec bus speed.  E.g. on RZ/Five, requesting a bus speed
> of 100 resp. 400 kHz will yield too-fast target bus speeds of 100806
> resp. 403226 Hz instead of 97656 resp. 390625 Hz.
> 
> Fix this by using DIV_ROUND_UP() in the subsequent divisions, too.
> 
> Tested on RZ/A1H, RZ/A2M, and RZ/Five.
> 
> Fixes: d982d66514192cdb ("i2c: riic: remove clock and frequency restrictions")
> Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Apart from the rounding issue fixed by this patch, I could not find any
> bugs in the calculation of the various parameters (based on the formulas
> in the documentation).  Still, the actual (measured) bus speed may still
> be higher than the target bus speed.  Hence this patch is not sufficient
> to reduce the actual bus speed to safe levels, and I have not yet addded
> 
>     Closes: https://lore.kernel.org/TYCPR01MB11269BFE7A9D3DC605BA2A2A9864E2@TYCPR01MB11269.jpnprd01.prod.outlook.com/

Can I add this in the commit log?

> On RZ/A1H (RSK+RZA1):
> 
>               speed    actual  duty  fall  rise  cks  brl  brh
>              ------  --------  ----  ----  ----  ---  ---  ---
>     before:  101600   113 kHz    63     1     4    3   20   10
>     after:    99181   110 kHz    64     1     4    3   21   10
> 
>     before:  396726   407 kHz    62     5     5    1   17    9
>     after:   396726   407 kHz    62     5     5    1   17    9
> 
>     Note that before commit d982d66514192cdb, the actual values were
>     within spec, so probably the parameters were hand-tuned with the
>     help of scope:
>              101600    99.2 kHz  63     1     4    3   19   16
> 	     396726   370   kHz  62     5     5    1   21    9
> 
> RZ/A2M (RZA2MEVB):
> 
>               speed    actual  duty  fall  rise  cks  brl  brh
>              ------  --------  ----  ----  ----  ---  ---  ---
>     before:  100609   115 kHz    63     1     4    4   20   10
>     after:    98214   111 kHz    64     1     4    4   21   10
> 
>     before:  402439   459 kHz    61     5     5    2   16    9
>     after:   392857   446 kHz    62     5     5    2   17    9
> 
> RZ/Five (RZ/Five  SMARC):
> 
>               speed    actual  duty  fall  rise  cks  brl  brh
>              ------  --------  ----  ----  ----  ---  ---  ---
>     before:  100806   112 kHz    64     0     3    5   15    7
>     after:    97656   108 kHz    65     0     3    5   16    7
> 
>     before:  403225   446 kHz    60     3     3    3   12    7
>     after:   390625   431 kHz    61     3     3    3   13    7
> 
> I.e. the actual bus speed is still up to 10% higher than requested.
> 
> The driver assumes the default register settings:
>   - FER.SCLE = 1 (SCL sync circuit enabled, adds 2 or 3 cycles)
>   - FER.NFE = 1 (noise circuit enabled)
>   - MR3.NF = 0 (1 cycle of noise filtered out)
> As these are not explicitly set by the driver, I verified that the
> assumptions are true on all affected platforms.
> 
> I also tried disabling FER.SCLE and removing the compensation for SCLE
> on RZ/Five.  For a bus speed of 100 kHz, that gave:
> 
>               speed    actual     duty  fall  rise  cks  brl  brh
>              ------  ----------   ----  ----  ----  ---  ---  ---
>     before:   97656   108   kHz   65     0     3    5   16    7
>     after:    97656    94.7 kHz   63     0     3    5   18    9
> 
> which looks better, but obviously the SCL sync circuit must add some
> value?
> 
> So it looks like the default values provided by i2c_parse_fw_timings()
> do not work well for us, and all board DTS files should provide suitable
> values explicitly, using the "i2c-scl-rising-time-ns" and
> "i2c-scl-falling-time-ns" properties.
> Adam submitted something similar for R-Car a while ago[1].

It's a pity that all this description is lost. I love long
explanations especially when they come from test results.

Can I add it in the commit log?

Andi

> Thanks for your comments!
> 
> [1] "[PATCH] arm64: dts: renesas: beacon: Fix i2c2 speed calcuation"
>     https://lore.kernel.org/20210825122757.91133-1-aford173@gmail.com
> ---
>  drivers/i2c/busses/i2c-riic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
> index 0c2342f86d3d2fbe..a6aeb40aae04d607 100644
> --- a/drivers/i2c/busses/i2c-riic.c
> +++ b/drivers/i2c/busses/i2c-riic.c
> @@ -352,7 +352,7 @@ static int riic_init_hw(struct riic_dev *riic)
>  		if (brl <= (0x1F + 3))
>  			break;
>  
> -		total_ticks /= 2;
> +		total_ticks = DIV_ROUND_UP(total_ticks, 2);
>  		rate /= 2;
>  	}
>  
> -- 
> 2.34.1
> 


Return-Path: <linux-i2c+bounces-7029-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 354DE9873C8
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 14:44:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 665121C23AF5
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 12:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E0EA125D5;
	Thu, 26 Sep 2024 12:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BOkMMkrQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3ABC149;
	Thu, 26 Sep 2024 12:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727354690; cv=none; b=ZcQWdZ9carRQ1fzQxz1qGhogtTG7fL0Z9LnrQcVTtW6lDWXZgTzvFigun2IeFxejFflMUa/kHi1b35KqMb3ngg5r3xIm/4c12w/13PXIbx83jqo98Aj/VPbXRJ0SxdqVsrq3AccYAKXCHY8D7A3EFLiyoUquzGbQaONKzh8ZggE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727354690; c=relaxed/simple;
	bh=GkIY3c3npPTD0w2O0sRGPXuhmHmcjOpIsk+qPP4jbhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LrUhvIWql/EqT6o2oYvlQwJ0AF+uDXu59d9Vi7LNwhqsez6WEjomSHxqPkhLrOKPl7Md0vnBdRxQOLMiFnwM1TnbWF1Eaxvp6PvtzyNRtZj52htTxYoVH0Iz9u5ogkqdiYpmS2QaM2yAo+2t4eIvCuoWZjzZWYK+OvZlYhquuVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BOkMMkrQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBB0AC4CEC9;
	Thu, 26 Sep 2024 12:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727354689;
	bh=GkIY3c3npPTD0w2O0sRGPXuhmHmcjOpIsk+qPP4jbhM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BOkMMkrQQaxoqX/hX//yP/nO872WQZaE6UDewg8kR3sbhm98jQ2PmsbJvF+v9HzlX
	 uWspBbn7kvyrMrCP8zhk3KKjxCCb76O/S5H7J15b9vQ0Cna6oetAxnztZ/SkJUU5pZ
	 R3siVhK/1l+zygsLyUk//NGexKxa7zr2PeIFtDgX8CAIg5jv9ndCL6vh9ZbQ81NZKK
	 QAEvEnUOct/Id39auxI6G2bBb1x8ZAAjzHHyyP0eQTM2YTP/dF5MVYWqU7B/dtrhmo
	 /W0701hLo2EAphNFq6uLo+oJBtLbynHzuZYW3hZ2+Jdo0TM6iAetlZiqkB1QV9yeyi
	 efPM+LuqoSY1Q==
Date: Thu, 26 Sep 2024 14:44:47 +0200
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, 
	andi.shyti@kernel.org, linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_srichara@quicinc.com, quic_varada@quicinc.com
Subject: Re: [PATCH v2 1/1] i2c: qcom-geni: Support systems with 32MHz serial
 engine clock
Message-ID: <epgcibdthvaicvoao6vuvged4cfohmz4sbrubp7rkn5wh4l3zq@qdg52odoy6db>
References: <20240926034304.3565278-1-quic_mmanikan@quicinc.com>
 <732bdb12-a52b-4abe-8edb-afed44406011@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <732bdb12-a52b-4abe-8edb-afed44406011@quicinc.com>

On Thu, Sep 26, 2024 at 11:44:20AM GMT, Mukesh Kumar Savaliya wrote:
> Hi Manikanta, My suggestion:
> 
> i2c: qcom-geni: Support systems with 32MHz serial engine clock
> [Derive i2c clock from 32MHz Sourced clock]

I'm fine with a more accurate subject, but to me your sentence indicates
"there's a choice of where the i2c clock is sourced from, now make it
come from the 32MHz clock".

Is this really what's going on? (Patch content and commit message
indicates no)

Is the "Sourced clock" the name of specific clock? Why does it have a
capital 'S'?

Regards,
Bjorn

> 
> On 9/26/2024 9:13 AM, Manikanta Mylavarapu wrote:
> > In existing socs, I2C serial engine is sourced from XO (19.2MHz).
> > Where as in IPQ5424, I2C serial engine is sourced from GPLL0 (32MHz).
> > 
> > The existing map table is based on 19.2MHz. This patch incorporate
> incorporate/s/incorporates
> > the clock map table to derive the SCL clock from the 32MHz source
> > clock frequency.
> > 
> > Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> > ---
> > Changes in v2:
> > 	- Dropped IPQ5424 from the commit title
> > 	- Added else part to assign geni_i2c_clk_map_19p2mhz to itr
> > 	- Dropped MHZ macro and used HZ_PER_MHZ macro
> > 	- Expanded SE to serial engine
> > 	- Added the reason for 32MHz clock in commit message
> > 
> >   drivers/i2c/busses/i2c-qcom-geni.c | 19 ++++++++++++++++---
> >   1 file changed, 16 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> > index 212336f724a6..22f2a0d83641 100644
> > --- a/drivers/i2c/busses/i2c-qcom-geni.c
> > +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> > @@ -16,6 +16,7 @@
> >   #include <linux/pm_runtime.h>
> >   #include <linux/soc/qcom/geni-se.h>
> >   #include <linux/spinlock.h>
> > +#include <linux/units.h>
> >   #define SE_I2C_TX_TRANS_LEN		0x26c
> >   #define SE_I2C_RX_TRANS_LEN		0x270
> > @@ -146,18 +147,30 @@ struct geni_i2c_clk_fld {
> >    * clk_freq_out = t / t_cycle
> >    * source_clock = 19.2 MHz
> >    */
> > -static const struct geni_i2c_clk_fld geni_i2c_clk_map[] = {
> > +static const struct geni_i2c_clk_fld geni_i2c_clk_map_19p2mhz[] = {
> >   	{KHZ(100), 7, 10, 11, 26},
> >   	{KHZ(400), 2,  5, 12, 24},
> >   	{KHZ(1000), 1, 3,  9, 18},
> >   };
> > +/* source_clock = 32 MHz */
> > +static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz[] = {
> > +	{KHZ(100), 7, 14, 18, 40},
> > +	{KHZ(400), 4,  3, 11, 20},
> > +	{KHZ(1000), 4, 3,  6, 15},
> > +};
> > +
> >   static int geni_i2c_clk_map_idx(struct geni_i2c_dev *gi2c)
> >   {
> >   	int i;
> > -	const struct geni_i2c_clk_fld *itr = geni_i2c_clk_map;
> > +	const struct geni_i2c_clk_fld *itr;
> > +
> > +	if (clk_get_rate(gi2c->se.clk) == 32 * HZ_PER_MHZ)
> > +		itr = geni_i2c_clk_map_32mhz;
> > +	else
> > +		itr = geni_i2c_clk_map_19p2mhz;
> > -	for (i = 0; i < ARRAY_SIZE(geni_i2c_clk_map); i++, itr++) {
> > +	for (i = 0; i < ARRAY_SIZE(geni_i2c_clk_map_19p2mhz); i++, itr++) {
> >   		if (itr->clk_freq_out == gi2c->clk_freq_out) {
> >   			gi2c->clk_fld = itr;
> >   			return 0;
> 


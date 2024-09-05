Return-Path: <linux-i2c+bounces-6221-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A674496CE19
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 06:35:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6074828298F
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 04:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C48C6155382;
	Thu,  5 Sep 2024 04:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DzQjuqhb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F58154456;
	Thu,  5 Sep 2024 04:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725510885; cv=none; b=EhIsqV6ihggihHZZsHGDbTeWmYXZ741BYV0CUlnXoClV+du9khOvYkgk9LBs3vpjFcdS3fMGc/RGn6ahctHmLGaAw1xRZ91kcwW78vWwWKlaLTlblMG0jmlQbbkvcCeHeviWZCL38ETfyebBS+KVGtzmBUBToXnsyUBRi0l+2qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725510885; c=relaxed/simple;
	bh=aPzXBFJHZm3v5j42RugmPOfTrNEaxPAD9cyBL8Jy5es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ix4EIb0WdZd1KS2ReXJ7cnguSb4D+ReTmwvUf5pQS8BtM0+D1SYa3hjVHGfqSByLFSQTM4q+cFMY4SOUKFXDBcjJmM1/jyWz7jr1k0x97KevqI+Zuwu/Zga4Fb29qVx2rm1eCtE1USvRZtmBAj2p9nqs0Cc0bzCmS0BiRUZIFQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DzQjuqhb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E8E2C4CEC4;
	Thu,  5 Sep 2024 04:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725510885;
	bh=aPzXBFJHZm3v5j42RugmPOfTrNEaxPAD9cyBL8Jy5es=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DzQjuqhbR5wPPcWHl/FbBnE0uuPsHOluaUd1sTO7pHzAb6vgvtWbRrhL407j9fZst
	 9IsKyhrl3MVioqsM0nU8pXDRJTDNDlgPrIL+yvljJzqeGNiXJZelkxWHYfm71o9qNN
	 V2Wt6fxVLrsMvZejgkA4oArt/uh0GuZQN4Mi7o5vbawRK06WB4Rc8YaxfkRYYfYk6X
	 F9LV/S2mQJPgs0GPcAp9CnNci9Ifphc+GCs0DW5br0E18o7zDfk+GZf/Q2FiQ0DkZq
	 b+HunivnFrX3yQMka7iahJXaOJnIr4X1SwTEwGo98nwXT36kEq09SeZ985dSvjWls1
	 C42rPp05PN1rg==
Date: Thu, 5 Sep 2024 04:34:40 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v6 11/12] platform/chrome: Introduce device tree hardware
 prober
Message-ID: <Ztk04Pfa3tXyrDJq@google.com>
References: <20240904090016.2841572-1-wenst@chromium.org>
 <20240904090016.2841572-12-wenst@chromium.org>
 <Ztgxlmhnkn7NVC81@google.com>
 <CAGXv+5GpKu-b4_dbRcuSG4NxQi_FKh9p7iMh6DfgavkLFdLLdQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5GpKu-b4_dbRcuSG4NxQi_FKh9p7iMh6DfgavkLFdLLdQ@mail.gmail.com>

On Thu, Sep 05, 2024 at 11:52:32AM +0800, Chen-Yu Tsai wrote:
> On Wed, Sep 4, 2024 at 6:08 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
> >
> > On Wed, Sep 04, 2024 at 05:00:13PM +0800, Chen-Yu Tsai wrote:
> > > diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/platform/chrome/chromeos_of_hw_prober.c
> > [...]
> > > +static int chromeos_of_hw_prober_probe(struct platform_device *pdev)
> > > +{
> > > +     for (size_t i = 0; i < ARRAY_SIZE(hw_prober_platforms); i++) {
> > > +             int ret;
> > > +
> > > +             if (!of_machine_is_compatible(hw_prober_platforms[i].compatible))
> > > +                     continue;
> > > +
> > > +             ret = hw_prober_platforms[i].prober(&pdev->dev, hw_prober_platforms[i].data);
> > > +             /* Ignore unrecoverable errors and keep going through other probers */
> > > +             if (ret == -EPROBE_DEFER)
> > > +                     return ret;
> >
> > Is it harmless if some of the components get probed multiple times?  E.g.:
> > comp1 probed -> comp2 probed -> comp3 returned -EPROBE_DEFER -> some time
> > later, chromeos_of_hw_prober_probe() gets called again.
> 
> Yes it is harmless. Components already enabled will not get disabled
> in the error path. And the prober that enabled that component will see
> that a component was enabled, and skip doing the whole process again.
> 
> So something like:
> 
>     comp1 probed -> comp2 probed -> comp3 -EPROBE_DEFER ->
>         comp1 skip -> comp2 skip -> comp3 probed

I assume this patch will be applied through the i2c tree:
Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>


Return-Path: <linux-i2c+bounces-6975-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A96985551
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 10:18:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AC951F23CE5
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 08:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DD6915990E;
	Wed, 25 Sep 2024 08:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RGTZH0ch"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD99215921D;
	Wed, 25 Sep 2024 08:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727252309; cv=none; b=TaLQ53yOLPJ6tk6o7nNyzE1f6h2UMHJadCpJ8Sxx0IPaiP5jW2hY3G9+YS8rfYgeAcTWOfAViR5ghrksmh9twtxSke/RfKq9RmKdDkPgvEE3uiOJh5QxhDvENyXHtUGuktpD0ny4pdKdnhFqmWbz+cTKg/RiMKNQozl5GgDqZ6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727252309; c=relaxed/simple;
	bh=RUsSczpAQhjEZF2llEwXsNcte5FrVgymGy0NJjooLZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aDnakGozXX6p/fLlCuLFXlEwVu41etY/4jc2dOlJJU/hiA0YPNrHngt3JcXw7HY8cr9sZa8j7Jk3ZWdIb1jY6Who+fUtG1IA4o0jJtJ9EBLaX0k9dWnB8zpbP9NekVj4t2HzzDJKlz7XGHQRoPoV8kq936t9LYQIP0CLBkNX3Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RGTZH0ch; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2217C4CEC3;
	Wed, 25 Sep 2024 08:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727252309;
	bh=RUsSczpAQhjEZF2llEwXsNcte5FrVgymGy0NJjooLZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RGTZH0chrp9C23KPq4ZCeEayg+95LwkRcwlpHaCcYLLd+t5PDRO9BQPwGx09zlFig
	 GZrh/2ujIA81v3Ke+PZ4CfeMd472AtFttJMi88H6ynarqmjCf1kzhvXdn5yDjBR+rq
	 RNdJkXCrYm0uHOymki/Akhjv6pFIx6rXrLsJZTCnEBLEUjtVgJ8WLx01evHwIlOrYt
	 Uh0pv81vt9hU7SGx+LskuF3yHJ0mZmrO/efoHLXwLKFO0FMxK5vK+kBhLry2qTRbtm
	 437ch9Y1lN+A6Ie8DhxNWWVODveNJr4oI+3v/YXje4RNvdwm8oW4u1mJGHoZ+//Xhy
	 qytltr+03SIyQ==
Date: Wed, 25 Sep 2024 10:18:24 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: "zoie.lin" <zoie.lin@mediatek.com>, Qii Wang <qii.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [v1,1/1] i2c: mediatek: add runtime PM operations and bus
 regulator control
Message-ID: <duauce4b6hlugfo6yelviaflkktfaix6g2kd2yqgdv5o36nhh4@despelul5fq5>
References: <20240920143627.23811-1-zoie.lin@mediatek.com>
 <20240920143627.23811-2-zoie.lin@mediatek.com>
 <33dc7f60-4364-4d7a-a66b-4bd881b41675@collabora.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33dc7f60-4364-4d7a-a66b-4bd881b41675@collabora.com>

Hi,

...

> > @@ -1486,19 +1530,22 @@ static int mtk_i2c_probe(struct platform_device *pdev)
> >   	if (ret < 0) {
> >   		dev_err(&pdev->dev,
> >   			"Request I2C IRQ %d fail\n", irq);
> > -		goto err_bulk_unprepare;
> > +		goto err_clk_bulk_unprepare;
> >   	}
> > +	pm_runtime_set_autosuspend_delay(&pdev->dev, 1000);
> 
> One full second as autosuspend delay? Can this be shortened to 500? 250?
> 
> How was the one second wait chosen?
> 
> How much time does mtk_i2c_runtime_resume() take to resume the bus?

Besides that, please add a comment to explain why you chose
1000/500/250. Arbitrary values are not much appreciated.

Thanks,
Andi


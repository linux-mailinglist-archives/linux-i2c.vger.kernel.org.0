Return-Path: <linux-i2c+bounces-6225-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6131F96CF74
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 08:37:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A5A61B20C16
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 06:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC5EE18BB9B;
	Thu,  5 Sep 2024 06:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b="SucWx4wW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="n/79yWOx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fhigh3-smtp.messagingengine.com (fhigh3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DD7189BB5;
	Thu,  5 Sep 2024 06:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725518195; cv=none; b=PAGzPGZEuaQsa+EriZALdNOwAkxTCXbZd7UqC/CUtSLcbOS9+YL7/l3gYOBRyFmz+AxtW84l5tf7s3WDm+drDDDfq+I6gdaIwY05QDivHvto73eMc1dikd/DQ9dBVQYTGjstnjVD1Lj25KKXeppPscmuN7DaXuWBx2pKfnh5CtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725518195; c=relaxed/simple;
	bh=ieGdSh4onMR57QpajuWhSOfOVKy2H+a4sMG+vBKM9V0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=jc/49MuVqUXoLEkiOt2f8OehycZ61PcnOKaIf+kNZZSIBHPFXMZa/o2rjgJllbNzKq+Qhq9GImqpF81TA6wtv18WBd8LWYjCtcdJw8CU82XXK3StSoJ0016HXmXilZ2VkPLOq/sYXgwoHFex7A7VaNkBtTv3RkcBMv590qdbPI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu; spf=pass smtp.mailfrom=readahead.eu; dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b=SucWx4wW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=n/79yWOx; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=readahead.eu
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4DCA7114021B;
	Thu,  5 Sep 2024 02:36:30 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-01.internal (MEProxy); Thu, 05 Sep 2024 02:36:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=readahead.eu; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1725518190;
	 x=1725604590; bh=PWDzdW/xLq6m2UP0K8K6zATWTvz4LuIj8tZS0VhhB4I=; b=
	SucWx4wW6cKtN5PAPPhPNywyyhvAcZpPHrEJRTA3npT72wsfcUREElaA80vdKtlr
	i5ejbUjTrznXF6imLEmMOkHZJLv3T7uN4HkpIXpNd1jTQZ6GLJ1Nj5I+Oohw0129
	gVZXBAEGCxgK/bqaYl4l7ALUaBVl8XZLTrltybPt3PU7SZk8kH/9bHpuyqgHbA43
	vRl+sp4q+SI3bnklo7qG8K64FSD+CrNdt755SypKbDrTr9fFy2DA3R5usRPRUm3b
	49TRajtYDXq3YIxNZAJaYdTMlCmC5Jz4ZRXhnZN7aGb7v5mZ8dyPUkiPYoJKDMT6
	q9C2aNmgqeZMxeu43CnhXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725518190; x=
	1725604590; bh=PWDzdW/xLq6m2UP0K8K6zATWTvz4LuIj8tZS0VhhB4I=; b=n
	/79yWOxKwjxIuy21AMf+VJAb/dF0sgsYAS46h+4WNmA0Az+/Sdu5XzWKwnRLThQZ
	1fB/sTpAaQkDo8wEcc+Ytg9t8uF0X2Y/E9zatmGtmL/1GJ1jFi7pdSNtjJXISJJb
	4Fn28TNATlHsTsByIz3nEPkIPnkD9F9DlMFyZsLpOzIsk7i/0IxK2OW+s84d6SQN
	+kw/69sz8FZSGFBOomjf2iQjG8WEBly1OtiLKUoRj5QFY82VqzblWaFAga45Fa9k
	yin/0h/JbYDwxsn/hr9wZXxZxbb58NBiX5nacVsYFfP82PtA/6kYnOZ08+4hVWoI
	vYoCJ0cpyn4ht6t/kyCIA==
X-ME-Sender: <xms:bFHZZhWgmCSgbcsqfye8PhJXoXgVald2uLdlrhmO-5oVETaXTL7X4w>
    <xme:bFHZZhkjIcayL-66KnkP3nAxnaYn_EluqMDaolK5uusd8EQESkKjAw-eWy25cixwj
    D0CRxK8FMNGEzrupdg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehkedgudduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdffrghvihguucfthhgvihhnshgsvghrghdfuceouggrvhhiugesrh
    gvrggurghhvggrugdrvghuqeenucggtffrrghtthgvrhhnpeethfetfefhfeetffffffet
    veeujeelieehteegheffieelveefhfekgeekfeegleenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurghvihgusehrvggruggrhhgvrggurdgv
    uhdpnhgspghrtghpthhtohepvddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhope
    gujhhoghhorhgthhhotghksehgmhgrihhlrdgtohhmpdhrtghpthhtohepghhuphhtvddu
    sehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgviihinhdrrghlvgigrghnuggvrhesgh
    hmrghilhdrtghomhdprhgtphhtthhopehmihgthhgrvghlrdiirghiughmrghnsehgmhgr
    ihhlrdgtohhmpdhrtghpthhtohepshgrvhhitggrlhgvkhhsrgekfeesghhmrghilhdrtg
    homhdprhgtphhtthhopehlihiivghtrghoudeshhhurgifvghirdgtohhmpdhrtghpthht
    ohepmhgvsehjrggtkhguohgrnhdrtghomhdprhgtphhtthhopegsvghnthhishhssehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehjihhkohhssehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:bFHZZta_ECLfNlzlzCciklQfSk_yoRPIszW__6fTDcmiJN5kHiFMTw>
    <xmx:bFHZZkVepz8xCGQj_T9PK-hxO7o3QL53Fe5LQmThvtjsn1f22KfA1Q>
    <xmx:bFHZZrnl1HJaQQ3v6Y7GP86x0AvUlLDf8O4GI5kXKSN42JMQwqv_6w>
    <xmx:bFHZZheifOB8UDK-jhPf9mYbf-V14chrek4CWBpezDOzoMLCF_Qd_Q>
    <xmx:blHZZtoVerMoggq4Gn2z3pAsmQygTW-f3tvDVNlQEoPwUT2zLEnWIGbt>
Feedback-ID: id2994666:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D177618A006B; Thu,  5 Sep 2024 02:36:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 05 Sep 2024 08:35:57 +0200
From: "David Rheinsberg" <david@readahead.eu>
To: "Li Zetao" <lizetao1@huawei.com>, "Jiri Kosina" <jikos@kernel.org>,
 bentiss@kernel.org, michael.zaidman@gmail.com, gupt21@gmail.com,
 djogorchock@gmail.com, rrameshbabu@nvidia.com, bonbons@linux-vserver.org,
 roderick.colenbrander@sony.com, savicaleksa83@gmail.com, me@jackdoan.com,
 jdelvare@suse.com, linux@roeck-us.net, mail@mariuszachmann.de,
 wilken.gottwalt@posteo.net, jonas@protocubo.io, mezin.alexander@gmail.com
Cc: linux-input@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-hwmon@vger.kernel.org
Message-Id: <13b7ede6-0e84-4a48-891b-2b75bff9c342@app.fastmail.com>
In-Reply-To: <20240904123607.3407364-12-lizetao1@huawei.com>
References: <20240904123607.3407364-1-lizetao1@huawei.com>
 <20240904123607.3407364-12-lizetao1@huawei.com>
Subject: Re: [PATCH -next 11/19] HID: wiimote: Use devm_hid_hw_start_and_open in
 wiimote_hid_probe()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi

On Wed, Sep 4, 2024, at 2:35 PM, Li Zetao wrote:
> Currently, the wiimote module needs to maintain hid resources
> by itself. Consider using devm_hid_hw_start_and_open helper to ensure
> that hid resources are consistent with the device life cycle, and release
> hid resources before device is released. At the same time, it can avoid
> the goto-release encoding, drop the err_close and err_stop lables.
>
> Signed-off-by: Li Zetao <lizetao1@huawei.com>
> ---
>  drivers/hid/hid-wiimote-core.c | 20 +++-----------------
>  1 file changed, 3 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/hid/hid-wiimote-core.c b/drivers/hid/hid-wiimote-core.c
> index 26167cfb696f..28cd9ccbb617 100644
> --- a/drivers/hid/hid-wiimote-core.c
> +++ b/drivers/hid/hid-wiimote-core.c
> @@ -1780,8 +1780,6 @@ static void wiimote_destroy(struct wiimote_data *wdata)
>  	wiimote_ext_unload(wdata);
>  	wiimote_modules_unload(wdata);
>  	cancel_work_sync(&wdata->queue.worker);
> -	hid_hw_close(wdata->hdev);
> -	hid_hw_stop(wdata->hdev);
> 
>  	kfree(wdata);
>  }
> @@ -1806,22 +1804,14 @@ static int wiimote_hid_probe(struct hid_device *hdev,
>  		goto err;
>  	}
> 
> -	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
> -	if (ret) {
> -		hid_err(hdev, "HW start failed\n");
> +	ret = devm_hid_hw_start_and_open(hdev, HID_CONNECT_HIDRAW);
> +	if (ret)
>  		goto err;
> -	}
> -
> -	ret = hid_hw_open(hdev);
> -	if (ret) {
> -		hid_err(hdev, "cannot start hardware I/O\n");
> -		goto err_stop;
> -	}
> 
>  	ret = device_create_file(&hdev->dev, &dev_attr_extension);
>  	if (ret) {
>  		hid_err(hdev, "cannot create sysfs attribute\n");
> -		goto err_close;
> +		goto err;
>  	}
> 
>  	ret = device_create_file(&hdev->dev, &dev_attr_devtype);
> @@ -1847,10 +1837,6 @@ static int wiimote_hid_probe(struct hid_device *hdev,
> 
>  err_ext:
>  	device_remove_file(&wdata->hdev->dev, &dev_attr_extension);
> -err_close:
> -	hid_hw_close(hdev);
> -err_stop:
> -	hid_hw_stop(hdev);
>  err:
>  	input_free_device(wdata->ir);
>  	input_free_device(wdata->accel);
> -- 
> 2.34.1

Looks good!

Reviewed-by: David Rheinsberg <david@readahead.eu>

Thanks
David


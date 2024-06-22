Return-Path: <linux-i2c+bounces-4261-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 502C89134E2
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 17:35:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E0372846FC
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 15:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCFCE16F906;
	Sat, 22 Jun 2024 15:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ReGyvDPG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A0116DED9;
	Sat, 22 Jun 2024 15:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719070546; cv=none; b=WdEAQhAgdtPmJFWP9MVvuUmlRmnqsZh5/e2r5JnPg9yOfOHKWvZONnF2RiGatIFgP2m91QkuWk2ISLU5x8DWwiiHHYcmuJ10jGc7fjzRVjyFgNF2MCQ5WlaBdarWGoOGJ5V1LnbOfyExSiBwexl413EErO19KtrrwXPB53Y+aGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719070546; c=relaxed/simple;
	bh=Z2BL16sOEHi4sHfh2ElMfjmBhXWlXl2pXuSY8/P2tH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FtHBCjW2g5ZibsMHTgjlu4JOtaFecgl4dS1gsRnBu5K/hr/ty5mVKZO5jmzkVYxSpztShAwox1nvy4E2t564zDKj4z0khvALGYXCumAsBWOfTIxbIrF55Qy9rVeG+gVuHN396JwPjEl4SkMHuT8BMTTKOT/cpkSxaJi6/3Iw63k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ReGyvDPG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE5A2C3277B;
	Sat, 22 Jun 2024 15:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719070544;
	bh=Z2BL16sOEHi4sHfh2ElMfjmBhXWlXl2pXuSY8/P2tH4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ReGyvDPGzdLiZSznbAJbAM9NFbRUnPt2xlcI/kLq6a4Onup+gBpNJNi7sTZXLEUWu
	 6LT5ZJZjuzYWQvNvvOFn/U/9wj5D9lXiRKu54/axjjCMROxtXTjqoXnTvL21VcAZ1e
	 kAWBk9GQ5ti4autUECesZrqq3oT987Ch0ieXGgM2MAvqVTSgLbO9vcXD8IF/ycjb+d
	 obASwUn5RaM727UIIknJIbi+FdU1xh9nhGfazNpFJvi5SqFTOjD6nTzJ0OpU/wEwxI
	 c1JKg7eAE50wkvK5TnMSamxkSHvT5Oi/t+1JvLiGzwapoEF0TpMr8VuU0r/8oAsdvB
	 jP24ZAX8EEbMw==
Received: by pali.im (Postfix)
	id 504C7BF5; Sat, 22 Jun 2024 17:35:41 +0200 (CEST)
Date: Sat, 22 Jun 2024 17:35:41 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>, Wolfram Sang <wsa@kernel.org>,
	eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>,
	Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 3/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
Message-ID: <20240622153541.6mqmgyqtexjtxhda@pali>
References: <20240621122503.10034-1-hdegoede@redhat.com>
 <20240621122503.10034-4-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621122503.10034-4-hdegoede@redhat.com>
User-Agent: NeoMutt/20180716

On Friday 21 June 2024 14:24:58 Hans de Goede wrote:
> +static void smo8800_instantiate_i2c_client(struct work_struct *work)
> +{
> +	struct smo8800_device *smo8800 =
> +		container_of(work, struct smo8800_device, i2c_work);
> +	const struct dmi_system_id *lis3lv02d_dmi_id;
> +	struct i2c_board_info info = { };
> +	struct i2c_adapter *adap = NULL;
> +
> +	if (smo8800->i2c_dev)
> +		return;
> +
> +	bus_for_each_dev(&i2c_bus_type, NULL, &adap, smo8800_find_i801);
> +	if (!adap)
> +		return;
> +
> +	lis3lv02d_dmi_id = dmi_first_match(smo8800_lis3lv02d_devices);

Result of this function call is always same. You can call it just once,
e.g. in module __init section and store cached result.

> +	if (!lis3lv02d_dmi_id)
> +		goto out_put_adapter;
> +
> +	info.addr = (long)lis3lv02d_dmi_id->driver_data;
> +	strscpy(info.type, "lis3lv02d", I2C_NAME_SIZE);
> +
> +	smo8800->i2c_dev = i2c_new_client_device(adap, &info);
> +	if (IS_ERR(smo8800->i2c_dev)) {
> +		dev_err(smo8800->dev, "error %ld registering %s i2c_client\n",
> +			PTR_ERR(smo8800->i2c_dev), info.type);
> +		smo8800->i2c_dev = NULL;
> +	} else {
> +		dev_dbg(smo8800->dev, "registered %s i2c_client on address 0x%02x\n",
> +			info.type, info.addr);
> +	}
> +
> +out_put_adapter:
> +	i2c_put_adapter(adap);
> +}


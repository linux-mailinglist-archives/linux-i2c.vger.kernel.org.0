Return-Path: <linux-i2c+bounces-991-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBF681DCD3
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Dec 2023 22:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBB891C20AD0
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Dec 2023 21:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C4D3FC13;
	Sun, 24 Dec 2023 21:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F12m9Zxp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11231FBEF;
	Sun, 24 Dec 2023 21:55:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63C99C433C8;
	Sun, 24 Dec 2023 21:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703454905;
	bh=+1IdkVA8YFjPm5n/5CMwt7sIHg+XrrBgME2RzdVfJDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F12m9ZxpBi2hAGrFoO53XWFskUJBYgNf/9qM6hCagWHzmTDnnFkulYu1ORqZ5h9sc
	 09n+gP0DcjyM/Y2lwacHrQK2ijiNxNCKzYDOk55T7/qFrA9USZnpLOyYYV/zsXV6RD
	 GvevSkcEHGtzFrYCj9Gmh6cdYruB3BSJ9/uiIX6mhj/jKx1JuETe0ksH8F+cWG4ucn
	 YXh30sJL9alM+7LQYREQbFaF0CgoM8JAZWDegFxSeHZWZzxHMlTWo48I4QZGG29f4t
	 FMiMEVg/UoHlot9FJdmnOgfGiKttEwxiVDlO8KXobqIyZyWhPgv5jFZfy5pSsxOGKN
	 yyhsXdRujs9mg==
Received: by pali.im (Postfix)
	id B33E281B; Sun, 24 Dec 2023 22:55:02 +0100 (CET)
Date: Sun, 24 Dec 2023 22:55:02 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	Eric Piel <eric.piel@tremplin-utc.net>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, Dell.Client.Kernel@dell.com,
	Marius Hoch <mail@mariushoch.de>,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	Wolfram Sang <wsa@kernel.org>, platform-driver-x86@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH 3/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
Message-ID: <20231224215502.dq6a2sq2hdfrpwof@pali>
References: <20231224213629.395741-1-hdegoede@redhat.com>
 <20231224213629.395741-4-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231224213629.395741-4-hdegoede@redhat.com>
User-Agent: NeoMutt/20180716

On Sunday 24 December 2023 22:36:19 Hans de Goede wrote:
> +static int smo8800_find_i801(struct device *dev, void *data)
> +{
> +	static const u16 i801_idf_pci_device_ids[] = {
> +		0x1d70, /* Patsburg (PCH) */
> +		0x1d71, /* Patsburg (PCH) */
> +		0x1d72, /* Patsburg (PCH) */
> +		0x8d7d, /* Wellsburg (PCH) */
> +		0x8d7e, /* Wellsburg (PCH) */
> +		0x8d7f, /* Wellsburg (PCH) */
> +	};

I'm not happy with seeing another hardcoded list of device ids in the
driver. Are not we able to find compatible i801 adapter without need to
hardcode this list there in smo driver? And if really not, what about
sharing (or exporting) list from the i801 driver?

I'm just worried that this PCI id list will increase in the future and
it would be required to add a new and new id into it...

> +	struct i2c_adapter *adap, **adap_ret = data;
> +	struct pci_dev *pdev;
> +	int i;
> +
> +	adap = i2c_verify_adapter(dev);
> +	if (!adap)
> +		return 0;
> +
> +	if (!strstarts(adap->name, "SMBus I801 adapter"))
> +		return 0;
> +
> +	/* The parent of an I801 adapter is always a PCI device */
> +	pdev = to_pci_dev(adap->dev.parent);
> +	for (i = 0; i < ARRAY_SIZE(i801_idf_pci_device_ids); i++) {
> +		if (pdev->device == i801_idf_pci_device_ids[i])
> +			return 0; /* Only register client on main SMBus channel */
> +	}
> +
> +	*adap_ret = i2c_get_adapter(adap->nr);
> +	return 1;
> +}


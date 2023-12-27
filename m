Return-Path: <linux-i2c+bounces-1006-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E495781EB03
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Dec 2023 01:35:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 794F6283427
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Dec 2023 00:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16362A40;
	Wed, 27 Dec 2023 00:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dxGB0zE3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB26720EB;
	Wed, 27 Dec 2023 00:35:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07299C433C7;
	Wed, 27 Dec 2023 00:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703637300;
	bh=QQSzTEKVkjhzMRUNMGeszGHif36iIyhtPSxVUIgASzk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=dxGB0zE3RjIgHayBFc1uA1yap6INDB3FVNo1Zq0h5lm3KiTYy/oY3FDpRKh3OktVp
	 1rzTAD+osz5VIGcyTeX4+WCu9+/OWgUXBwBWF5glUzWHm8r1cnMF9s1CsIJM9+fyJf
	 yP/BmVVu8ZPUHSOtpCuXk4qLP249+JDCJeicsx16rLCXaPPmus4bxOBxMhlWkxR6wn
	 5h7I4aIZI7di/1HaZt8L7y7AlisOzxJWK4eLiDp3F2its93Tw3/zsZaKiCT3sJuGuH
	 3PS8ev+J7PgRTHCHVTXaHW7LmYseCUpgjJvZsx+FjUrxPe53+u9WKb6Pbooo2oFI42
	 XXqPgrrjPqb7w==
Date: Tue, 26 Dec 2023 18:34:58 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: platform-driver-x86@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>, linux-pci@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3] platform/x86: p2sb: Allow p2sb_bar() calls during PCI
 device probe
Message-ID: <20231227003458.GA1485669@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231225092656.2153894-1-shinichiro.kawasaki@wdc.com>

On Mon, Dec 25, 2023 at 06:26:56PM +0900, Shin'ichiro Kawasaki wrote:
> ...

> +static int p2sb_valid_resource(struct resource *res)
> +{
> +	return res->flags ? 0 : -ENOENT;
> +}

This got worse because it's *named* like a boolean, but the return
value can't be used like a boolean, which makes callers really hard to
read, e.g., this:

  if (p2sb_valid_resource(res))
    /* do something */

does exactly the opposite of what the reader expects.

I see that you want to use this -ENOENT return value in the callers:

> +static int p2sb_scan_and_cache(struct pci_bus *bus, unsigned int devfn)
> +{
> + ...
> +	return p2sb_valid_resource(&p2sb_resources[PCI_FUNC(devfn)].res);
> +}

> + * 0 on success or appropriate errno value on error.
> + */
> +int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
> +{
> + ...
> +	ret = p2sb_valid_resource(&cache->res);
> +	if (ret)
> +		return ret;

But I think these would be much clearer as something like this:

  static bool p2sb_valid_resource(struct resource *res)
  {
    if (res->flags)
      return true;

    return false;
  }

  static int p2sb_scan_and_cache(struct pci_bus *bus, unsigned int devfn)
  {
    ...
    if (!p2sb_valid_resource(&p2sb_resources[PCI_FUNC(devfn)].res))
      return -ENOENT;

    return 0;
  }

Bjorn


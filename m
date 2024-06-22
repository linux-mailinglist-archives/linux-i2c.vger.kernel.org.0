Return-Path: <linux-i2c+bounces-4266-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BE59136AB
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Jun 2024 00:41:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DED6281230
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 22:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2BB07829C;
	Sat, 22 Jun 2024 22:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eog0ZXW5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD054CDEC;
	Sat, 22 Jun 2024 22:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719096102; cv=none; b=dIUxbLaeWML+3qGkEgSJgNF0yFOfRA7vCn9CcooMRinLIQzCDbcTcb/J1T2ERwlOoASLkf6YT4jWGtQzu9dGM1TdEYfSLUoyCwgtHe70acSDRWsMD8dQ1qzzvviCEbheJxI5W8erOuWXtIQj1MQToCf+puhQ2BJQUaeInFyMWYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719096102; c=relaxed/simple;
	bh=MirGzHTVNTD7sSmyc2mqypAaUPT5i2E9Oms+YQKjzvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tHYooiuc+39xfKhW27ACbGQ9NXbRPyLmNo+HFkF9KjPe2LJ4wQ4ycv/LOhtSfgktIVP+uNuauBSYzLRDGdnVaXHPuc6CmO6YhgglCaUvM3rlZbGdEK2kOO1glNXyNPhg4+w5c30MEsrRGueJNLoCy2k4eXyLSFMm0HercoKI19s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eog0ZXW5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B738C4AF09;
	Sat, 22 Jun 2024 22:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719096101;
	bh=MirGzHTVNTD7sSmyc2mqypAaUPT5i2E9Oms+YQKjzvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Eog0ZXW56qiznUQj5F4mUwCZdF3S+fYkM9K0tp+kXrOozdZFjft/OwlKZVRnlkbsV
	 s0x59ExQAt2MTj8C3DuP0ERHd82+FxEdfL4jXrytfeV1f0ThBb72Zk9lRL2eNRCKK0
	 Gd6b1vWrYSKbfbffRxSF/3Nb9f5GETznlzaNjtlu54Wy+PeTzbNAAOJ1dKB5KT8Xm1
	 YgAxLiuAwBkGMrY//LnJie6LfyfXvMmG+m9laW7HEfCTgF5TvEXEtcsn5kPAy8OeM2
	 JbMw6Qup/mKS7JChcn4UHjFBqZy5MvAgMFQbPPxflNSK90VMmfw3JEMfRuIQnbKNTV
	 9rDhdNRTLx+ag==
Received: by pali.im (Postfix)
	id 7525164C; Sun, 23 Jun 2024 00:41:38 +0200 (CEST)
Date: Sun, 23 Jun 2024 00:41:38 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
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
Message-ID: <20240622224138.jhs3zftewfgoi4fb@pali>
References: <20240621122503.10034-1-hdegoede@redhat.com>
 <20240621122503.10034-4-hdegoede@redhat.com>
 <20240622131650.qxoxtp6aaitpar6a@pali>
 <ffbb42d9-f6c6-456e-8427-0c75c2a2e90d@redhat.com>
 <20240622142015.7cfl2onabpr6kl6r@pali>
 <b76dc029-ded0-4911-92ee-ab46351105cc@redhat.com>
 <CAHp75VfC-TBScyvB8uWiu2GqD2xCpNxBgavprZmv9OXPBCPPZQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VfC-TBScyvB8uWiu2GqD2xCpNxBgavprZmv9OXPBCPPZQ@mail.gmail.com>
User-Agent: NeoMutt/20180716

On Sunday 23 June 2024 00:36:28 Andy Shevchenko wrote:
> On Sat, Jun 22, 2024 at 4:26 PM Hans de Goede <hdegoede@redhat.com> wrote:
> > On 6/22/24 4:20 PM, Pali Rohár wrote:
> 
> 
> > This is code for special handling required for SMO88xx ACPI devices,
> > dell-smo8800 is *the* driver for those ACPI devices. So this code clearly
> > belongs here.
> >
> > According to diffstat this adds about 400 lines of code that is really not
> > that big, so I see no urgent reason to introduce weird tricks instead of
> > standard driver binding for this.
> 
> This discussion may make me wonder why we don't use
> MODULE_DEVICE_TABLE() for this strings, because it's a big advantage
> as well of using standard kernel data types and APIs.

In example which I sent in <20240622163518.rfm2wa2kzucy7in4@pali> I used
MODULE_DEVICE_TABLE with those DMI tables.


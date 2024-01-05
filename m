Return-Path: <linux-i2c+bounces-1164-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F13ED825AE0
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 19:59:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DC28287A07
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Jan 2024 18:59:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6036135EF9;
	Fri,  5 Jan 2024 18:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g9zeOR9W"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281C439AF6;
	Fri,  5 Jan 2024 18:52:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79E3BC433C7;
	Fri,  5 Jan 2024 18:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704480722;
	bh=WZKu2fgnenwxQPAp31Em2mW/NlqQUnQKDmS83MCvDjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g9zeOR9WxMNdnicIayQz6KwYHX95uIcHueJOuTqsE7qqkeXjrGCejX3iP7owE7sTf
	 yEINiCEBTwvKGkB2SwcMdc0zgm5EUe259f69ECXsn3jXbDZEhtCt+WloFA70XBBBQh
	 Br2lftNjHrBpCTrUew/jCCkaKsoWrcFkgRk0IZsccluY1wWn7nP3DA2c7e8jiBycOh
	 yAEbk3zZFNIvB7rId5yELns+6iA1exsfkNogz1RHSnZjohWx7HITv85quQf+Bvzop2
	 /hhpn41FmNDsdfHyHaICTTR9emskIZ9S0bMb75AYRSerQxRF7X3Nxq+ib7wcSWHZvJ
	 xQupOXLGlrySg==
Received: by pali.im (Postfix)
	id 58654A52; Fri,  5 Jan 2024 19:51:59 +0100 (CET)
Date: Fri, 5 Jan 2024 19:51:59 +0100
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
Subject: Re: [PATCH 6/6] platform/x86: dell-smo8800: Add support for probing
 for the accelerometer i2c address
Message-ID: <20240105185159.yle5fwcqywplpppj@pali>
References: <20231224213629.395741-1-hdegoede@redhat.com>
 <20231224213629.395741-7-hdegoede@redhat.com>
 <20231224220742.5cv2a7tdd4f2k4mt@pali>
 <8b3946e0-7eb5-4e1f-9708-1f6cfda95e1a@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8b3946e0-7eb5-4e1f-9708-1f6cfda95e1a@redhat.com>
User-Agent: NeoMutt/20180716

On Friday 05 January 2024 17:36:03 Hans de Goede wrote:
> Hi Pali,
> 
> On 12/24/23 23:07, Pali Rohár wrote:
> > On Sunday 24 December 2023 22:36:22 Hans de Goede wrote:
> >> Unfortunately the SMOxxxx ACPI device does not contain the i2c-address
> >> of the accelerometer. So a DMI product-name to address mapping table
> >> is used.
> >>
> >> At support to have the kernel probe for the i2c-address for modesl
> >> which are not on the list.
> >>
> >> The new probing code sits behind a new probe_i2c_addr module parameter,
> >> which is disabled by default because probing might be dangerous.
> >>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > 
> > I would really like to hear Dell opinion about this change, and if there
> > is really no way to get i2c address. Could you ask Dell people about it?
> > Always it is better to use official / vendor provided steps of hardware
> > detection, instead of inventing something new / own which would be there
> > for a long time...
> 
> Unfortunately I no longer have any contacts inside Dell for
> this and given Dell's non response in the original thread
> which started this I'm not hopefull for help from Dell here.

Well, writing an email to hundred of receivers, or writing 10 or more
emails at the same time is nowadays an example how to get your email
into spam box in lot of companies.

> Also there original reaction indicated that the info is not
> available in ACPI, so probing + extending the DMI match
> list seems to be the only way.

I have verified this statement years ago and therefore it applies only
for old models (about 10 years old). So using this statement is not
valid for new models anymore.

> Regards,
> 
> Hans
> 
> 


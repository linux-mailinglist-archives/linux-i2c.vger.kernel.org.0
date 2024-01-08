Return-Path: <linux-i2c+bounces-1208-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 823438270AB
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jan 2024 15:06:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E5A21C21CC1
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jan 2024 14:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A204653A;
	Mon,  8 Jan 2024 14:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NF+jiKQJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309B745955;
	Mon,  8 Jan 2024 14:06:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EECAC433C8;
	Mon,  8 Jan 2024 14:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1704722800;
	bh=aXJbmk8ChV+JHAFJckO5WHqZWqRQ4Lonbi/XWo70tfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NF+jiKQJLoIAcN2c6ykKoG/yulbID2iMZGEwfdtoJiDGRfCJFLvqNcQFjATUj1d4X
	 msq5a4dpy6E719rdQQEJHwrrbUJXjKdHgfCL/SPalhPCPA06fWUKELldS9JpA5ai6O
	 obMphweDE4Ib+NO7hbwfx8e7QUipXmIMRf4HDV58=
Date: Mon, 8 Jan 2024 15:06:37 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Eric Piel <eric.piel@tremplin-utc.net>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, Dell.Client.Kernel@dell.com,
	Marius Hoch <mail@mariushoch.de>,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	Wolfram Sang <wsa@kernel.org>, platform-driver-x86@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: Re: Dell contacts (was: [PATCH 6/6] platform/x86: dell-smo8800: Add
 support for probing for the accelerometer i2c address)
Message-ID: <2024010830-trusting-smudge-4b44@gregkh>
References: <20231224213629.395741-1-hdegoede@redhat.com>
 <20231224213629.395741-7-hdegoede@redhat.com>
 <20231224220742.5cv2a7tdd4f2k4mt@pali>
 <8b3946e0-7eb5-4e1f-9708-1f6cfda95e1a@redhat.com>
 <34c13a37-4e58-4913-9db6-9819f76fbfb4@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <34c13a37-4e58-4913-9db6-9819f76fbfb4@molgen.mpg.de>

On Mon, Jan 08, 2024 at 02:22:09PM +0100, Paul Menzel wrote:
> Dear Greg,
> 
> 
> Am 05.01.24 um 17:36 schrieb Hans de Goede:
> 
> > On 12/24/23 23:07, Pali Rohár wrote:
> > > On Sunday 24 December 2023 22:36:22 Hans de Goede wrote:
> > > > Unfortunately the SMOxxxx ACPI device does not contain the i2c-address
> > > > of the accelerometer. So a DMI product-name to address mapping table
> > > > is used.
> > > > 
> > > > At support to have the kernel probe for the i2c-address for models
> > > > which are not on the list.
> > > > 
> > > > The new probing code sits behind a new probe_i2c_addr module parameter,
> > > > which is disabled by default because probing might be dangerous.
> > > > 
> > > > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > > 
> > > I would really like to hear Dell opinion about this change, and if there
> > > is really no way to get i2c address. Could you ask Dell people about it?
> > > Always it is better to use official / vendor provided steps of hardware
> > > detection, instead of inventing something new / own which would be there
> > > for a long time...
> > 
> > Unfortunately I no longer have any contacts inside Dell for
> > this and given Dell's non response in the original thread
> > which started this I'm not hopeful for help from Dell here.
> 
> Unfortunately, since Mario Limonciello left Dell and works at AMD now,
> despite adding Dell.Client.Kernel@dell.com to Cc: I never received a reply
> from them. Do you have any contacts?

I do not, sorry.


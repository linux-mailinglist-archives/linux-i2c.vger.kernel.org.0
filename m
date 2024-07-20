Return-Path: <linux-i2c+bounces-5044-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 546399380FD
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Jul 2024 13:32:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09770282571
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Jul 2024 11:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5BED39AC9;
	Sat, 20 Jul 2024 11:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AQOZVR4u"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619D9B646;
	Sat, 20 Jul 2024 11:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721475117; cv=none; b=No2eMLvExAT1GwiTIYR5QwCztAKm3lwe4Cgi0W34WggUFGWJFNeLwbUEmd4BUk2V9sAyNh7z1o5To9NZhxHwKgmZKJEGFi6mhMa4gqW4z7VW5xYiEalvYRRCvtPjhuJq0QzPfM0/ky975z1SdE7Bwqn/fj+NkxKcjC73FCVKX28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721475117; c=relaxed/simple;
	bh=E2Ts6Cizss4QEjk4HAFdSy6yPFt87VYmfpjuaEPGsbo=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TZ8feOroBLa2lctbhGtJEIbMwUd0/XjlQRpa9VMq+1QWXk9kYY7zHEaf88mwUTrSyNyfsE9sp9tnWXyCideyL6V5fN3GpQI9isnSpYKThYt/iGFvmkU2RIeH7u8nxTOvQTBYjdWUP33TjJoukoZBp1MElKGi2WlQycbjNTVR5fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AQOZVR4u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70A4FC2BD10;
	Sat, 20 Jul 2024 11:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721475116;
	bh=E2Ts6Cizss4QEjk4HAFdSy6yPFt87VYmfpjuaEPGsbo=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=AQOZVR4uYYRu/5dNYJlGYZmRC6vMG3CY3VHuvu1L4HGl+y5LsYmClnDg915jiySan
	 Cnnvwg4HBSZsYmHa5VzThhIHOSlooHOkCraAeDP3MNWz8h1NghztV4o7iOdFzKHbs0
	 ArLko6COAKHpi5ma8/1CB4MDX0Xw6PxpN5LmMnBn/DtWb0Qgz0hffjoeamQ4/SwtYM
	 pV/YfKCklNl33wcEr1ek0hDlhjKZbBbva779oYW4d3Ymkc7YxtRy1g9sJskVdCrLbd
	 l8K5dzSOMUOQFShjxCv7dChw/KhyY5APhCHRfNW7l+2wstvHm728GqcNg/V+00l7nw
	 +7ulZnPQ+ztHA==
Date: Sat, 20 Jul 2024 13:31:53 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c <linux-i2c@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host for v6.11 - part 2
Message-ID: <fg2byff6apqkdztjmql4x7eknpxdokjpwne6zwyrrfdpjugcr6@joo4vdlvgb56>
References: <csu2tvshcxyz7yib2mrcczxa345m2qu6lavngulzq35b2hi7bz@ao5p3do67q7p>
 <ZpudPAKFtrIszTMS@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZpudPAKFtrIszTMS@shikoro>

Hi Wolfram,

On Sat, Jul 20, 2024 at 01:19:24PM GMT, Wolfram Sang wrote:
> 
> >       i2c: piix4: Register SPDs
> 
> I just saw that this patch has:
> 
>     Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>     Tested-by: Guenter Roeck <linux@roeck-us.net>
>     Reviewed-and-tested-by: Guenter Roeck <linux@roeck-us.net>
> 
> So, that's doubled. Could you kindly fix it?

Oh, yes, I wanted to separate the Reviewed-and-tested-by, but
then I forgot to remove it.

Thanks for checking it. I updated the branch and the tag. I'm
pasting the git-request-pull output as a reference.

Thank you Wolfram!
Andi

The following changes since commit 8e5c0abfa02d85b9cd2419567ad2d73ed8fe4b74:

  Merge tag 'input-for-v6.11-rc0' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input (2024-07-19 16:51:39 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags/i2c-host-6.11-part-2

for you to fetch changes up to de4f2f52f93257433c9029ba2b4044cd9f029b21:

  i2c: piix4: Register SPDs (2024-07-20 13:29:10 +0200)

----------------------------------------------------------------
Added descriptions in the DTS for the Qualcomm SM8650 and SM8550
Camera Control Interface (CCI).

Added support for the "settle-time-us" property, which allows the
gpio-mux device to switch from one bus to another with a
configurable delay. The time can be set in the DTS.

The latest change also includes file sorting.

Fixed slot numbering in the SMBus framework to prevent failures
when more than 8 slots are occupied. It now enforces a a maximum
of 8 slots to be used. This ensures that the Intel PIIX4 device
can register the SPDs correctly without failure, even if other
slots are populated but not used.

----------------------------------------------------------------
Bastien Curutchet (3):
      dt-bindings: i2c: mux-gpio: Add 'settle-time-us' property
      i2c: mux: gpio: Re-order #include to match alphabetic order
      i2c: mux: gpio: Add support for the 'settle-time-us' property

Thomas Weiﬂschuh (2):
      i2c: smbus: remove i801 assumptions from SPD probing
      i2c: piix4: Register SPDs

Vladimir Zapolskiy (2):
      dt-bindings: i2c: qcom-cci: Document sm8550 compatible
      dt-bindings: i2c: qcom-cci: Document sm8650 compatible

 Documentation/devicetree/bindings/i2c/i2c-mux-gpio.yaml |  3 +++
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 20 ++++++++++++++++++++
 drivers/i2c/busses/Kconfig                              |  1 +
 drivers/i2c/busses/i2c-piix4.c                          |  9 +++++++++
 drivers/i2c/i2c-smbus.c                                 | 15 ++++-----------
 drivers/i2c/muxes/i2c-mux-gpio.c                        | 14 ++++++++++----
 include/linux/platform_data/i2c-mux-gpio.h              |  2 ++
 7 files changed, 49 insertions(+), 15 deletions(-)



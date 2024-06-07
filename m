Return-Path: <linux-i2c+bounces-3911-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A701900951
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 17:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E8461F222CC
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 15:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABA84198A24;
	Fri,  7 Jun 2024 15:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pmhw7Knb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6EE171BB;
	Fri,  7 Jun 2024 15:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717774742; cv=none; b=O9UIR3PghZeUdG0LPAwX20ikEuU0UWUshzMFsfoPj1pqrPH2mBI0YwziSpBXvbSK+9q6HTFbxoJm0KBTgs9lgti7W33Z70T8R+7Ek00dfobU0WF/3v308xzMPMgexOzcy4iT3BjMKt/+klagHuLu+zQlJS2iBjYVX1FDWCNRh5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717774742; c=relaxed/simple;
	bh=C8AdvS3D3ulp2oWqS7pqZc6JQsM874Op4YI9otLDZzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=XNyWj4IxPuLmfMPFUGXlBlHSiFKJZ3Z+DYAo9tPvdQJK/5R8V1HCOZ68n0GfX40xglJgs6WskOrMAiFrA0jEWKuK4yFIuyh81tKVoIEv5Eyjt2odTbIgUY0kiK6vQaS9Fir/0pdMNeNGzoK9eG3qg3qb6RMRczU5fB7cKW3xraM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pmhw7Knb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1AC9C2BBFC;
	Fri,  7 Jun 2024 15:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717774742;
	bh=C8AdvS3D3ulp2oWqS7pqZc6JQsM874Op4YI9otLDZzQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Pmhw7Knb5GxmpBpg5yX2ToDHR3HkLAFJLfvbw01dAm89v4WFqgvjHg9DNoWMPnrA7
	 dds3t1eAE0HTX7MDcNzi98XzEr4f0q2BafnAOutjuDmfJ5pnADIaaF02L8ylli/0t2
	 9W41U7gvKSP2hnq956uxjk7ZybOt2R55C0nTJ6EOD6W7fEH6cVmU2HIL1V7VgarWFM
	 TR0VNNihgNG7fVnhsQ1jce1B5BH4x4KWjkZVrATutXc7dg5smQL4vDqsE30NA/VJ4O
	 PYd2u/ydlvynIZXHa3vLFjgXTHlS7EPAqEbLWsvz0cHU5fWn+sGCCRtFT2IWkD9jeg
	 IWKHyQuLh2lgw==
Date: Fri, 7 Jun 2024 10:39:00 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Noah Wang <noahwang.wang@outlook.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, linux@roeck-us.net,
	conor+dt@kernel.org, jdelvare@suse.com, corbet@lwn.net,
	Delphine_CC_Chiu@wiwynn.com, peteryin.openbmc@gmail.com,
	javier.carrasco.cruz@gmail.com, patrick.rudolph@9elements.com,
	bhelgaas@google.com, lukas@wunner.de, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 0/4] hwmon: Add support for MPS mp2993,mp9941 chip
Message-ID: <20240607153900.GA847228@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SEYPR04MB64822EE797B0CB024A913DFFFAFB2@SEYPR04MB6482.apcprd04.prod.outlook.com>

On Fri, Jun 07, 2024 at 05:05:40PM +0800, Noah Wang wrote:
> Add mp2993,mp9941 driver in hwmon and add dt-bindings for them.
> 
> Noah Wang (4):
>   dt-bindings: hwmon: Add MPS mp2993
>   hwmon: add MP2993 driver
>   dt-bindings: hwmon: Add MPS mp9941
>   hwmon: add MP9941 driver

Don't repost just for this, but for some reason the patches in this
series didn't get posted as responses to this cover letter.  Here's a
link to the archive, where you can see the lack of responses, and the
result when you try to download the series with b4:

  https://lore.kernel.org/all/SEYPR04MB64822EE797B0CB024A913DFFFAFB2@SEYPR04MB6482.apcprd04.prod.outlook.com/

  $ b4 am https://lore.kernel.org/all/SEYPR04MB64822EE797B0CB024A913DFFFAFB2@SEYPR04MB6482.apcprd04.prod.outlook.com
  Analyzing 1 messages in the thread
  No patches found.

Compare to this correctly threaded series and the download with b4:

  https://lore.kernel.org/all/cover.1717773890.git.jani.nikula@intel.com

  $ b4 am https://lore.kernel.org/all/cover.1717773890.git.jani.nikula@intel.com
  Grabbing thread from lore.kernel.org/all/cover.1717773890.git.jani.nikula@intel.com/t.mbox.gz
  Analyzing 7 messages in the thread
  Checking attestation on all messages, may take a moment...
  ---
    ✓ [PATCH v2 1/6] drm/i915/gvt: remove the unused end parameter from calc_index()
    ✓ [PATCH v2 2/6] drm/i915/gvt: use proper i915_reg_t for calc_index() parameters
    ✓ [PATCH v2 3/6] drm/i915/gvt: rename range variable to stride
    ✓ [PATCH v2 4/6] drm/i915/gvt: do not use implict dev_priv in DSPSURF_TO_PIPE()
    ✓ [PATCH v2 5/6] drm/i915: relocate some DSPCNTR reg bit definitions
    ✓ [PATCH v2 6/6] drm/i915: remove unused pipe/plane B register macros
    ---
    ✓ Signed: DKIM/intel.com
  ---
  Total patches: 6
  ---
  Cover: ./v2_20240607_jani_nikula_drm_i915_gvt_register_macro_cleanups_unused_macro_removals.cover
   Link: https://lore.kernel.org/r/cover.1717773890.git.jani.nikula@intel.com
   Base: not specified
	 git am ./v2_20240607_jani_nikula_drm_i915_gvt_register_macro_cleanups_unused_macro_removals.mbx


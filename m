Return-Path: <linux-i2c+bounces-11818-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE0FAF7F36
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jul 2025 19:41:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84DD2543E8E
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jul 2025 17:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E09288C9F;
	Thu,  3 Jul 2025 17:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bHA+UJ3f"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9178A2F2360;
	Thu,  3 Jul 2025 17:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751564471; cv=none; b=AKYR6UWtiLT3U3sWUNF6gYPROBqbQc5fAULUVUWwiGcPJupgKjtdUs/9fJ/vc/EdwyBXQVhdhZvR7Ifu74sE4R+E2mgz6J60FrxWwdU8AH8KjmPZf1jvmokmbPSrDaLymMThw9pQGNJxbDHZpBVMAuJo6iNx3a/ZkT/3V/1XkaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751564471; c=relaxed/simple;
	bh=rWLfgENFeeWZLgKSTQfNHO434DpX7XUNq3Q+RnmpCMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IoApZq/JGyoyrN///vcdQtPQG21uzynKgTgMrS6aA+WJHVkP+peHfhzM8TszgH4LtMaTdRC3fiyp38YwYmVuuugmEhMtt5bagFY/YumbrB7MiGSbOvoBW/bB79EIbk5Ywcsb7QS/59J3Ie+/a5Cfa0TgBOtDfenmypWxcRG83Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bHA+UJ3f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82B6FC4CEE3;
	Thu,  3 Jul 2025 17:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751564470;
	bh=rWLfgENFeeWZLgKSTQfNHO434DpX7XUNq3Q+RnmpCMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bHA+UJ3fT5Pu1QBjzja6bY0wbi5PsEgPwQ234eSyHKTfoK58nEz3vkLEqyb55ckwo
	 y0sM5Tzf/wotSPvyH56bPle9OqI535joR3ftGgbC5sfoXzE6ji2Re4opQqLYqq7lKl
	 khOxhWMsJFsOvjAD5BMxGTZwmbkZr5kbx/NumlwL5TK+dGpqqeZWRXEXgFpFYKxQ5+
	 0WVPpXe0qvJESJYq5wNnKfVrpeBdweDUat2Owynq/4Rv496XMyaw9EG42Liu+CHSLC
	 cKjdqd1JZ7l0zx+4EOaXFMLJC1mCjqseHNye+hks0ctROXf0K0/Kx4ccB/LF3uaL0j
	 qGzoKDEes58Ew==
Date: Thu, 3 Jul 2025 19:41:05 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Jan Dabros <jsd@semihalf.com>, Raag Jadav <raag.jadav@intel.com>, 
	"Tauro, Riana" <riana.tauro@intel.com>, "Adatrao, Srinivasa" <srinivasa.adatrao@intel.com>, 
	"Michael J. Ruhl" <michael.j.ruhl@intel.com>, intel-xe@lists.freedesktop.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/5] drm/xe: i2c support
Message-ID: <2qhkmfveb7vrjuhmeeij2off6wiczfh4hetzayizsrbuc57ewe@kbu6th33p5pp>
References: <20250701122252.2590230-1-heikki.krogerus@linux.intel.com>
 <s7kfne6budueamqqbshbrrtql6awrp7mvfhqlkrvtyhqjqsech@qemfad4phmlj>
 <aGWqCfpcYUla6T2e@intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGWqCfpcYUla6T2e@intel.com>

Hi Rodrigo,

On Wed, Jul 02, 2025 at 05:52:09PM -0400, Rodrigo Vivi wrote:
> On Wed, Jul 02, 2025 at 07:18:50PM +0200, Andi Shyti wrote:
> > > Heikki Krogerus (3):
> > >   i2c: designware: Use polling by default when there is no irq resource
> > >   i2c: designware: Add quirk for Intel Xe
> > 
> > I think you could have kept Jarkko's ack here. Up to you.
> > 
> > Anyone against me taking the two above already?
> 
> I was thinking about keeping Jarkko's ack and get all merged at
> once in drm-xe-next.

fine with me.

Andi


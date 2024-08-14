Return-Path: <linux-i2c+bounces-5390-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F42C951F48
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 18:00:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81CC81C212B3
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 16:00:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ACBF1B86C8;
	Wed, 14 Aug 2024 16:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LuEz0ygT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8111B5808;
	Wed, 14 Aug 2024 15:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723651201; cv=none; b=VCJ/VxjhNA6nqip3pRZ+FHxPVdDZMuwYmWQuNQQcCb7OoqbsdomP0iBtV6TzB6dJ45PckZXgNCkHhnrFo4JNvWowYullZ1IiAR6ZhXlQZCKyD7QeW5n5vUa2XDfiWBRcWqf5rUP+vigaMdD4UF3CaqduBHCcIzOcshfuMhJgb/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723651201; c=relaxed/simple;
	bh=PQcZv/InB58hwOmU/7tJIH9BqZDzz4d0NFM1872PSj0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AdxIKrLWseH/RDP6XraQfghThxAL+kwZeuA3yBJJaykOvBWE2C1uxggUxK8K4XyssYsktINhYocPDi+ktxb/xGkYspekfPikfqftvFv1ECqgwf+/I6Xovjfs0RL0Bh02LkP0cH3L+A7k2Hii4R2qDnbpcDzmJBeW5WdgMGWPxQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LuEz0ygT; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F9BA60003;
	Wed, 14 Aug 2024 15:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723651196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GRkxoicq+udhmwg+wufaOSiQiJFaDc9CkC4zDEA03bI=;
	b=LuEz0ygT+vVGOFTRw10XG2JcHy16bomY6HgSOwv4iB8w9FdGfWYUimnPsQ0FpQT2qyEktF
	H+5dNZOCb+Bae54z7nLfHgytAqKvphUUx4wY7iieblyM8WJvSLWaigYTXH+nX+mkhOvhVz
	e4XmOQt2l61VH60ZRbCU8eVrAEkhEOIK2qjaN776bhNHKrQJ/LePEonItwIGt7FkDnKxtF
	z2rOAgj9/3SdEce+iCk5XLqXlIRvbfCTOuflqIL759mTgA8sQBoXQnrwZtAkXTdmn22Hbh
	97mA7zjflqvD16WR5dE8ze8O6eneug8zuqqB8lxYJqnvdO5vzs2RLd2ixCgPsQ==
Date: Wed, 14 Aug 2024 17:59:52 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Derek Kiernan
 <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Paul Kocialkowski <contact@paulk.fr>, =?UTF-8?Q?Herv?=
 =?UTF-8?Q?=C3=A9?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-i2c@vger.kernel.org, Paul Kocialkowski
 <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v3 0/7] Add support for GE SUNH hot-pluggable connector
Message-ID: <20240814175952.6b22b7ad@booty>
In-Reply-To: <20240809-hotplug-drm-bridge-v3-0-b4c178380bc9@bootlin.com>
References: <20240809-hotplug-drm-bridge-v3-0-b4c178380bc9@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello Rob,

On Fri, 09 Aug 2024 17:34:48 +0200
Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:

...

> However a few new rough edges emerged that are not yet solved in this
> v3. Discussion would help in finding the right direction:
> 
>  * Describing the NVMEM cell addition still requires adding two properties
>    to a node in the base tree. Not sure the current NVMEM cell bindings
>    allow to do better.

Do you have any thoughts about how to describe the NVMEM cell in DT
without adding properties?

As of now...

> 2: the "base" overlay
> 
> The "base" overlay describes the common components that are required to
> read the model ID. These are identical for all add-on models, thus only one
> "base" overlay is needed:
> 
>     /dts-v1/;
>     /plugin/;
> 
>     / {
>         fragment@0 {
>             target-path = "";
> 
>             __overlay__ {
>                 nvmem-cells = <&addon_id>;
>                 nvmem-cell-names = "id";

...the nvmem-cell* properties are the only ones that for lack of a
good solution get added to a node in the base tree, causing the memory
leak issue to be still present.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


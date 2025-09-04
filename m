Return-Path: <linux-i2c+bounces-12649-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1CFB4426A
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 18:14:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2381A038ED
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 16:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AED72F3C0C;
	Thu,  4 Sep 2025 16:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CtnaQX91"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4532F1FD8;
	Thu,  4 Sep 2025 16:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757002476; cv=none; b=TjpTkGoEL8nP8cHq2hJpwbXuRyErhlq0XtolGV4yGh/sHaN5hHIRrmnc7BOHafi33cnXmmag8l2f/7JWrxi+krVf0hXIUBtq2/ZoK4P+e2WlYCGKfvumphzSG21RpJ+UDZajVSy0KiMf4TzufNOXToFt3jGWPXy2QK0tS7jMkzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757002476; c=relaxed/simple;
	bh=Nc22WOHnx23uoyvBPLboSQ4H5Xk+n08JTo2ZpvR8CDc=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=Sr0ItO1j9JFte9zE90OHSYxsOC1CGHeOt+HqyJVjT7VWD8SxJMHSZKcst//3QX6LNi3F9txGnQ0KG/8kGIlID8kBL9gLSkk4lKgzkEJbi/m+UXGNpiKu8JtKe+6I5FO6jn5JZpz1BYjC0Xp/EmW+hZI+kQOf8b6/4rm+NkDALMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CtnaQX91; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B8FFC4CEF6;
	Thu,  4 Sep 2025 16:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757002475;
	bh=Nc22WOHnx23uoyvBPLboSQ4H5Xk+n08JTo2ZpvR8CDc=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=CtnaQX91CBxaqcLbHzHoXDg1+Mit302FyXwOGwSZ/7XFMkCgDzyPMLrxuWopx7Cqf
	 LgSKs9vegeJhXi06GHs9Qp6Ty70eho8LtQrC3cr68I3ldpJ+9z0AotBZ3cJral84hu
	 whY0ppIv9cXx10tSoUWlgS9PwkG9786I4m5VRFNFM/fHJxijaVZ9Pz3JM2+0/nTqew
	 mczAmNf5UF9W8p4DfFZ8WUTfmWUJrrxh+SNar9htf0HumhfMYGHuahAkeXRQP/bLB9
	 Em2OgubLpsRtDt/25K5ECSdtKLtAz0eM2DOScVUIiOTLCzdV30rksiDN4iYNlg79TV
	 ZIFMiJnjrJ1Uw==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Sep 2025 18:14:31 +0200
Message-Id: <DCK5E8KIEV7M.25EFO2EE7JS9V@kernel.org>
To: "Sakari Ailus" <sakari.ailus@linux.intel.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 1/2] device property: Add scoped fwnode child node
 iterators
Cc: =?utf-8?q?Jean-Fran=C3=A7ois_Lessard?= <jefflessard3@gmail.com>,
 "Wolfram Sang" <wsa+renesas@sang-engineering.com>, "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>, "Daniel Scally" <djrscally@gmail.com>,
 "Heikki Krogerus" <heikki.krogerus@linux.intel.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Javier Carrasco" <javier.carrasco.cruz@gmail.com>,
 <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-acpi@vger.kernel.org>
References: <20250902190443.3252-1-jefflessard3@gmail.com>
 <20250902190443.3252-2-jefflessard3@gmail.com>
 <aLhAKJBUNQVH1Vmf@kekkonen.localdomain>
 <DCJC7Q9MZEM3.34FU7BXXZ7UGF@kernel.org>
 <aLkqE9c9w9m4Axsp@kekkonen.localdomain>
 <DCJTOIQ4Q0Z5.Q2UE5AQU1X35@kernel.org>
 <aLlDJETaWTjiSP0L@kekkonen.localdomain>
 <DCJVYUINZ7KM.7RCV9P9KHTVM@kernel.org>
 <aLl-ABtFi2R9Wc1a@kekkonen.localdomain>
In-Reply-To: <aLl-ABtFi2R9Wc1a@kekkonen.localdomain>

On Thu Sep 4, 2025 at 1:54 PM CEST, Sakari Ailus wrote:
> If you're concerned of the use on ACPI platforms, none of the drivers usi=
ng
> the two available variants list any ACPI IDs, signifying they're not used
> on ACPI systems -- I don't think they ever have been.

Great -- sounds reasonable then.


Return-Path: <linux-i2c+bounces-12593-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C16AFB427DF
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Sep 2025 19:22:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D80EA3A5832
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Sep 2025 17:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7475A30C353;
	Wed,  3 Sep 2025 17:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cky2BVTe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0E229DB99;
	Wed,  3 Sep 2025 17:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756920154; cv=none; b=kr/CYAfrWdP8XJcO3KXBOw/aX79vRdftfarkae6S6pb96acXW6rZJ3O/9etUC1Qc0v1zpqRNlOckPAh9fFaGqyb5d0NCoswxmJllMoSE6kZlzcdYFqRlu77SUGovixkEoLj5ttaPF2nRTFBodMU8ccs2eboaexDTGhRUMFu9vX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756920154; c=relaxed/simple;
	bh=38qRBcVLemJuIO3Zcx8DVpVL1QoFDMKDswFRU8GkwHs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=WhlBYIYhrFzAcafaniueA1lEr7+oLe+GEL3qJLJ+DgBLrKJUkKRbFpIWZvrJOHdz/f5e+XZwovNChddLiZQymyAoZiNODOcLMb9ki5GUmLVB0hj+EFIxqHiODD6U+0Gcu32ToH8osxegkGOFwZWoXlr6oRND605pAaZIlaFhfPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cky2BVTe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37C9FC4CEE7;
	Wed,  3 Sep 2025 17:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756920153;
	bh=38qRBcVLemJuIO3Zcx8DVpVL1QoFDMKDswFRU8GkwHs=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Cky2BVTe8KD9vzLnUdMoMsD0y6FBMaEFOv9TN8sIYqX8BGaUBMpcUERzgyOidn3kN
	 HMul+OwyW8dXvDH0OBNIC+sOp6h1yg2VnO8Mc8DIT+Myl2bAcSz8Q59hEhuAu8pSbs
	 mfkqD0D2QTViQaVnvI47lCOryEM9JCjusn7w3gp5n9BQ2O5p7OIZboZkym4XaFOvPq
	 UgcXa3woQKwVYZkkVKNLuenq8kX0Ylkc7BXfhbG23pBo5ZxKlHC/kVaQHNgrNNfBRa
	 5BJpoSTp4eUNTlzRZRWNL3Bvz43M/4Ma4uW0akVd8JRUtgszdDpyn9YyibAgTbiNtt
	 7NybjNz9KNfhQ==
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Sep 2025 19:22:29 +0200
Message-Id: <DCJC7Q9MZEM3.34FU7BXXZ7UGF@kernel.org>
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
To: "Sakari Ailus" <sakari.ailus@linux.intel.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250902190443.3252-1-jefflessard3@gmail.com>
 <20250902190443.3252-2-jefflessard3@gmail.com>
 <aLhAKJBUNQVH1Vmf@kekkonen.localdomain>
In-Reply-To: <aLhAKJBUNQVH1Vmf@kekkonen.localdomain>

(Cc: Javier)

On Wed Sep 3, 2025 at 3:18 PM CEST, Sakari Ailus wrote:
> Do we really need the available variant?
>
> Please see
> <URL:https://lore.kernel.org/linux-acpi/Zwj12J5bTNUEnxA0@kekkonen.localdo=
main/>.
>
> I'll post a patch to remove fwnode_get_next_available_child_node(), too.

Either I'm missing something substantial or the link does indeed not provid=
e an
obvious justification of why you want to send a patch to remove
fwnode_get_next_available_child_node().

Do you mean to say that all fwnode backends always return true for
device_is_available() and hence the fwnode API should not make this distinc=
tion?

I.e. are you referring to the fact that of_fwnode_get_next_child_node() alw=
ays
calls of_get_next_available_child() and swnode has no device_is_available()
callback and hence is always available? What about ACPI?


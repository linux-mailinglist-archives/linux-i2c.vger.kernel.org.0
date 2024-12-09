Return-Path: <linux-i2c+bounces-8376-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4711B9E95C0
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Dec 2024 14:08:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2B6E167396
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Dec 2024 13:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4ECB1B424D;
	Mon,  9 Dec 2024 13:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A7Pc8LYA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE6A1ACED9;
	Mon,  9 Dec 2024 13:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733749236; cv=none; b=s09Y0eRE4UvBe9Jo107hG91gDgnyO4Eyqn/kkwwwoBqj+idEP7JSwqzD/fG8EYWRIfn71zOz1RwaNRlrfS3zRVpWPwjRYvf/QMJ5kWZ+QgF3vUd7pZhzGaw3y0Ec4c3n/Ok73PFiqzPTtWxAlWYY5wX0mpJPvfK8vEcRhotrN8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733749236; c=relaxed/simple;
	bh=ZPN5KJTJJARzoDMrVBZtrbiVVvltcpRydFDHwoPlhTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ocad4VxX/ZSoaSJE0gxSJMMreaszn/ZMvCHPmK+MzfC9XN7Coa/WjsYwdfcEAc4JfaG/2pNsbM+p/k7MROculZK4awiLZd6W5oLGKj/gdGdUL3LaaJ19TNz+7E4Q5EgyH40AbEA49jQrYDNgY/QOzr4QUiOzdTi46VJMzPRDwSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A7Pc8LYA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A841CC4CEDD;
	Mon,  9 Dec 2024 13:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733749235;
	bh=ZPN5KJTJJARzoDMrVBZtrbiVVvltcpRydFDHwoPlhTM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A7Pc8LYARDeKUSsFGv10Bb9goW/rpqmQ6ZOHkS4A7KJzIBJ5gRo1P85S+hkrmzSJI
	 nixjKQNetf8/CiKROlt/nPxAaKW3uqugWzfK/Ztyc3CFCA5y391f22ua3H+hXCKQm1
	 Gyx2hiXsdf4UxSyl3SxA+gWdtFGfa9DNXtnnRMekJliNJtKBpAV5BOVJcDihZIqrLZ
	 QQ5VnUrqCHFTGdwflawTBqHxNG2FG5p6QL7C0z/qrectlmZDcrN/ZqVxP1srCP+hJt
	 jGfgK9qKwk2qttb3gaSZNusy4E9P+WHlgOmNJ2lSXPLcfPBkn7oekqi0DsLzxI5eNU
	 6+6pH9Uj/HU8w==
Message-ID: <5ac1af85-deee-4ead-93ea-5016ba5c6b8f@kernel.org>
Date: Mon, 9 Dec 2024 15:00:31 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] i2c: omap: remove unused parameter
To: Dhruv Menon <dhruvmenon1104@gmail.com>, aaro.koskinen@iki.fi,
 andreas@kemnade.info, vigneshr@ti.com, andi.shyti@kernel.org
Cc: jmkrzyszt@gmail.com, tony@atomide.com, khilman@baylibre.com,
 linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org
References: <cover.1733217877.git.dhruvmenon1104@gmail.com>
 <e4327ab4199883ec2554222c2697225abb797491.1733217877.git.dhruvmenon1104@gmail.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <e4327ab4199883ec2554222c2697225abb797491.1733217877.git.dhruvmenon1104@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 07/12/2024 14:42, Dhruv Menon wrote:
> The parameters `is_rdr` in `omap_i2c_receive_data` and `is_xdr` in
> `omap_i2c_transmit_data` were unused in the function implementations.
> This commit removes these parameters.
> 
> Signed-off-by: Dhruv Menon <dhruvmenon1104@gmail.com>

Reviewed-by: Roger Quadros <rogerq@kernel.org>



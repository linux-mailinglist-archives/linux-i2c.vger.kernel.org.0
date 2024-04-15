Return-Path: <linux-i2c+bounces-2949-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A9E8A5C7C
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Apr 2024 22:54:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3DA128359B
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Apr 2024 20:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 100B415696E;
	Mon, 15 Apr 2024 20:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GJ9BTXPZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE361DFEB;
	Mon, 15 Apr 2024 20:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713214456; cv=none; b=a+5RD1NM2Y44flBUTLm8CmnlSdAMBKxM+SOfIk6yV05RnhbFTL3M2wRNqQssM7b8Cm2RxZqvRh69Ms3abmCbfE80zAYCQqtDq7ksJy6noyOZXtmL8oQjmatu8o2l22lLyIeGSGRTlTSutM1qw5P5n3XPbxQQsikVRfMlLumbpqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713214456; c=relaxed/simple;
	bh=VbQJ+rdQSN7sFgw0qz8nrxe7EDMb6/hAklXEgP8FwKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Trjt4hWBE0oLTqHCNtwITw2icS96dqpF2VZf0e4lnQzxBB4uVUwdCnF7K9giftq47ztQq/Z09xodmtJCTm8ww4N+leyooDKC+RCO+UDWOhfIcbukTW3HgngaWWSlRTzjqs/YqIXIxpekyz39z3Yt6nx26tG/bW1w7YQZL7Ty8ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GJ9BTXPZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC5D5C113CC;
	Mon, 15 Apr 2024 20:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713214456;
	bh=VbQJ+rdQSN7sFgw0qz8nrxe7EDMb6/hAklXEgP8FwKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GJ9BTXPZ/JccPVsrJoBsadqpbwEUIspktXepgpPesgnBZm2m6DMBkp0NpDpQF6vso
	 T8B2cOU4nWbZBZRwDZRpCrl1/DSVNtJIyqbSy6/meyRW9htR5LTOH1JgBLWzBdJ3nQ
	 KM9oZM42Gi5/JpUalipYNU7O/LH5zzNfQTZ25A1JoIO2G13lP+joRIYW+XZXpFSgxx
	 9tffy3O+c6YqLIbR7Pa5GPn/Z7kw7t9SeGEjXJ41bVdirreC1yi67u1bx5Kkuh4ZZg
	 FVyar8GPZG432l97qjKLAGuLaqZPwPsIiFUlBSXCH8175uUgOWyZ9orEtZKWLmBQTA
	 7Q76FpVZhpDiA==
Date: Mon, 15 Apr 2024 22:54:12 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Abhinav Jain <jain.abhinav177@gmail.com>
Cc: chris.packham@alliedtelesis.co.nz, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, javier.carrasco.cruz@gmail.com, 
	Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH] i2c: mpc: Removal of of_node_put with __free for auto
 cleanup
Message-ID: <vegjt4pcl2x2wmwso6ajbihqc6rpbup5knycnz76jz3zfbfpp4@opxek6apu3w4>
References: <20240415161220.8347-1-jain.abhinav177@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415161220.8347-1-jain.abhinav177@gmail.com>

Hi Abhinav,

>  	/* Enable I2C interrupts for mpc5121 */
> -	node_ctrl = of_find_compatible_node(NULL, NULL,
> -					    "fsl,mpc5121-i2c-ctrl");
> +	struct device_node *node_ctrl __free(device_node) =

How have you tested this?

Andi


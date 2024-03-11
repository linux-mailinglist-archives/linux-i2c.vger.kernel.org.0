Return-Path: <linux-i2c+bounces-2327-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6527A877D30
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Mar 2024 10:46:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC96F28348A
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Mar 2024 09:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0530208C8;
	Mon, 11 Mar 2024 09:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ShhF3VG3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B0317578
	for <linux-i2c@vger.kernel.org>; Mon, 11 Mar 2024 09:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710150405; cv=none; b=WlXYPKgra/UF11F1Ww12Af4wgGfPw0MURSwiGZLXQnJU4LI/CvC723SVN+e6dyI3cbZyv1GU2twwXlb+RsWoS6w/o/hPADMDAWXp84+GTNLJU3s+aOVYYT4PSfkL/yXJBhen+GmnhDcgQoAdrlmA7IZLZS8oTivCUBqTzkkMNwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710150405; c=relaxed/simple;
	bh=E7E1upiX5arE6KWuWqOvE0TEhQbp1zY1wmY3aOFyNQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OaT7rrq21YZgqYFdiVysqmKakD8f1GUitvw3Besl+btLaXvBiMU6GJNGsoPDf/8kXXtBXfjepOSHRyUOeprJUdLKPKUPMkaZbqUEj6/DX1QTyZUDsIct6DtmnZbOsg1uhni//0UfqXxaxhQww2lMPBbXZweOeXFSQ7IfUlYBHZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ShhF3VG3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83F6FC433F1;
	Mon, 11 Mar 2024 09:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710150405;
	bh=E7E1upiX5arE6KWuWqOvE0TEhQbp1zY1wmY3aOFyNQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ShhF3VG3lEr0qIVsBwciuDh/rKC8/bE/oPuOwAG1GGVgFfvY3DLLJQ1HQ3JhFpFJP
	 jtAjojuQdv2lcDCVrxZYBRZuQyH7tW7TKH4XbesWIC0wkJj0+Ji5l7142YgkiHd14I
	 sIbsV1jKItbxXbW/5n3zEYgksnKuFuUQVssKbhzcEHyrbI/srx+1EgMtsZk3JZxrWa
	 ebSj+Jz6fpg1/U3o/waX46j9VFJZWqCXciFNiJb+APgZs+6IT91XWR64Dy340BsrEM
	 yQE0fp1k1eVCZDTWkUxQjRYEQOpFBoiF2lyBmMEDj7GNhmLpzO33u34gMucKfjrfV5
	 ijwgNkKxQhqOg==
Date: Mon, 11 Mar 2024 10:46:41 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Hans Hu <hanshu-oc@zhaoxin.com>
Cc: linux-i2c@vger.kernel.org, wsa@kernel.org, hanshu@zhaoxin.com, 
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: Re: [PATCH v2 2/2] i2c: viai2c: Fix bug for msg->len is 0
Message-ID: <ttsii2v6awu3ttglvyjgbk3ybpfy6tetht456uu2qmw4f7dzib@pcw5qfxcgchx>
References: <a3c58b7f15276fab324dd1e158a9f00c195f6f0f.1710146668.git.hanshu-oc@zhaoxin.com>
 <3fb1398741536232a1e9b54a5de4072420046db5.1710146668.git.hanshu-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fb1398741536232a1e9b54a5de4072420046db5.1710146668.git.hanshu-oc@zhaoxin.com>

Hi Hans,

because Mukes had questions on the v1, please do include him for
the next versions.

On Mon, Mar 11, 2024 at 04:46:55PM +0800, Hans Hu wrote:
> For the case that msg->len is 0(I2C_SMBUS_QUICK), when the interrupt
> occurs, it means that the access has completed, viai2c_irq_xfer()
> should return 1.

The commit log is still not enough. We don't konw which patch has
introduced the error and why.

Next time, please, try to be a bit more specific, trying to anser
the questions:

 - what is the problem
 - how did you find out
 - how you fixed
 - how you tested it

But, I see that the issue was introduced here:

  4b0c0569f032 ("i2c: wmt: fix a bug when thread blocked")

This patch has not been yet merged into Wolfram's tree.
Therefore, I will ask you to let this go this time and we can
take the whole series after the merge window.

Please, fix all the issues you find, including the checkpatch
warnings/errors (please keep one patch per kind of checkpatch
fix).

Last thing, please keep bug fixes separate from
features/cosmetic/refactoring. They need to be merged separately.

Does it work for you?

Thanks,
Andi


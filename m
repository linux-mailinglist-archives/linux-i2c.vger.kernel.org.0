Return-Path: <linux-i2c+bounces-10943-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE9DAB47A0
	for <lists+linux-i2c@lfdr.de>; Tue, 13 May 2025 00:49:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D0DD171C26
	for <lists+linux-i2c@lfdr.de>; Mon, 12 May 2025 22:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3479C298CBD;
	Mon, 12 May 2025 22:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LZIXjqNm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E151F1DDC37;
	Mon, 12 May 2025 22:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747090148; cv=none; b=c72MmjIYutlWEBQC1gKOvsQbE2R5rUk6Cnsh8nxfld78etAu3D9OAQIRwJOrTNmjNClhyIb7rbM1baoaXf4VDPv1ww9eTLjhtEXej7UDCGbVBfam391MuynJL2kt647OCF7b0fncRBrOo89olgL8FhCVL0oiHDCNGejT79P4y0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747090148; c=relaxed/simple;
	bh=UiI1Jc8mCz25TVRMRgjQb9yc9oy0/KsT6mNqmrNzxq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oPC/8wHlFEvKI28gLLzDV7W29/iF0011U1q4rYSK9vEXD1yxoaptqubvlcQDICXrLfiONkP05jVsCo2gRDDIOVRRz0La1BWRzW2wR98Gn4u8g1rYz6l1Y30oPfQBlghaRk0a0deCppW9LHVqGLwO06maxbEHjAA4FlrUuQVd+Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LZIXjqNm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1584C4CEE7;
	Mon, 12 May 2025 22:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747090147;
	bh=UiI1Jc8mCz25TVRMRgjQb9yc9oy0/KsT6mNqmrNzxq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LZIXjqNm25u5KcSoEGcoEgDv5PWJevc/uX2C1Rr40FzY4H6k+oCMuXwulq5HOocnY
	 6WsYG8DqepsIQ4R8mlNl07YaVqR3maBAbBIVe/qw9RmUs2Wg6TPzXcmT3zsckQJrMC
	 /RFQo2KcSfbquLNp8lJzwx+SjYwNiwvQqAliJe55g6lHHPNUN9BOJeUSx7i0HKo9L8
	 pk8gZ6YYuPiGyJVCSZtUHsbSdmYWKXmZUQDx0F8wEACAfUP60mHPPlbzuQmUKS6RBA
	 UWUA2D1E1RgVnrKBWvjAfmnQZ9UC1lAY+Glt9PKj2iCZQQjjK9pS+I28oB8c6Z5298
	 S5ns3sCqhpFKw==
Date: Tue, 13 May 2025 00:49:03 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Chris Babroski <cbabroski@nvidia.com>
Cc: kblaiech@nvidia.com, asmaa@nvidia.com, davthompson@nvidia.com, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] i2c-mlxbf: Add repeated start condition support
Message-ID: <bfw2kpxfiy2ulc5fi32ytly6y4fzqer6hvsq443tw43m624qof@6wl5ayvfl7my>
References: <20250506193059.321345-1-cbabroski@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506193059.321345-1-cbabroski@nvidia.com>

Hi Chris,

both patches merged to i2c/i2c-host.

Thanks,
Andi

On Tue, May 06, 2025 at 07:30:58PM +0000, Chris Babroski wrote:
> Add support for SMBus repeated start conditions to the Mellanox I2C
> driver. This support is specifically enabled for the
> I2C_FUNC_SMBUS_WRITE_I2C_BLOCK implementation which is required for
> communication with a specific I2C device on BlueField 3.
> 
> Signed-off-by: Chris Babroski <cbabroski@nvidia.com>
> Reviewed-by: Asmaa Mnebhi <asmaa@nvidia.com>
> Reviewed-by: Khalil Blaiech <kblaiech@nvidia.com>
> ---
>  V3 -> V4: Split changes into two separate logical patches
>  V2 -> V3: Cleaned up code and address review comments
>  V1 -> V2: Removed default "Reviewed-by:" tags
> 
>  drivers/i2c/busses/i2c-mlxbf.c | 34 ++++++++++++++++++++++++++--------
>  1 file changed, 26 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
> index b3a73921ab69..0f5b6a00c1b6 100644
> --- a/drivers/i2c/busses/i2c-mlxbf.c
> +++ b/drivers/i2c/busses/i2c-mlxbf.c
> @@ -222,7 +222,7 @@
>  
>  #define MLXBF_I2C_MASTER_ENABLE \
>  	(MLXBF_I2C_MASTER_LOCK_BIT | MLXBF_I2C_MASTER_BUSY_BIT | \
> -	 MLXBF_I2C_MASTER_START_BIT | MLXBF_I2C_MASTER_STOP_BIT)
> +	 MLXBF_I2C_MASTER_START_BIT)
>  
>  #define MLXBF_I2C_MASTER_ENABLE_WRITE \
>  	(MLXBF_I2C_MASTER_ENABLE | MLXBF_I2C_MASTER_CTL_WRITE_BIT)
> @@ -336,6 +336,7 @@ enum {
>  	MLXBF_I2C_F_SMBUS_BLOCK = BIT(5),
>  	MLXBF_I2C_F_SMBUS_PEC = BIT(6),
>  	MLXBF_I2C_F_SMBUS_PROCESS_CALL = BIT(7),
> +	MLXBF_I2C_F_WRITE_WITHOUT_STOP = BIT(8),
>  };
>  
>  /* Mellanox BlueField chip type. */
> @@ -694,16 +695,19 @@ static void mlxbf_i2c_smbus_read_data(struct mlxbf_i2c_priv *priv,
>  }
>  
>  static int mlxbf_i2c_smbus_enable(struct mlxbf_i2c_priv *priv, u8 slave,
> -				  u8 len, u8 block_en, u8 pec_en, bool read)
> +				  u8 len, u8 block_en, u8 pec_en, bool read,
> +				  bool stop)
>  {
> -	u32 command;
> +	u32 command = 0;
>  
>  	/* Set Master GW control word. */
> +	if (stop)
> +		command |= MLXBF_I2C_MASTER_STOP_BIT;
>  	if (read) {
> -		command = MLXBF_I2C_MASTER_ENABLE_READ;
> +		command |= MLXBF_I2C_MASTER_ENABLE_READ;
>  		command |= rol32(len, MLXBF_I2C_MASTER_READ_SHIFT);
>  	} else {
> -		command = MLXBF_I2C_MASTER_ENABLE_WRITE;
> +		command |= MLXBF_I2C_MASTER_ENABLE_WRITE;
>  		command |= rol32(len, MLXBF_I2C_MASTER_WRITE_SHIFT);
>  	}
>  	command |= rol32(slave, MLXBF_I2C_MASTER_SLV_ADDR_SHIFT);
> @@ -738,9 +742,11 @@ mlxbf_i2c_smbus_start_transaction(struct mlxbf_i2c_priv *priv,
>  	u8 op_idx, data_idx, data_len, write_len, read_len;
>  	struct mlxbf_i2c_smbus_operation *operation;
>  	u8 read_en, write_en, block_en, pec_en;
> -	u8 slave, flags, addr;
> +	bool stop_after_write = true;
> +	u8 slave, addr;
>  	u8 *read_buf;
>  	int ret = 0;
> +	u32 flags;
>  
>  	if (request->operation_cnt > MLXBF_I2C_SMBUS_MAX_OP_CNT)
>  		return -EINVAL;
> @@ -799,7 +805,16 @@ mlxbf_i2c_smbus_start_transaction(struct mlxbf_i2c_priv *priv,
>  			memcpy(data_desc + data_idx,
>  			       operation->buffer, operation->length);
>  			data_idx += operation->length;
> +
> +			/*
> +			 * The stop condition can be skipped when writing on the bus
> +			 * to implement a repeated start condition on the next read
> +			 * as required for several SMBus and I2C operations.
> +			 */
> +			if (flags & MLXBF_I2C_F_WRITE_WITHOUT_STOP)
> +				stop_after_write = false;
>  		}
> +
>  		/*
>  		 * We assume that read operations are performed only once per
>  		 * SMBus transaction. *TBD* protect this statement so it won't
> @@ -825,7 +840,7 @@ mlxbf_i2c_smbus_start_transaction(struct mlxbf_i2c_priv *priv,
>  
>  	if (write_en) {
>  		ret = mlxbf_i2c_smbus_enable(priv, slave, write_len, block_en,
> -					 pec_en, 0);
> +					 pec_en, 0, stop_after_write);
>  		if (ret)
>  			goto out_unlock;
>  	}
> @@ -835,7 +850,7 @@ mlxbf_i2c_smbus_start_transaction(struct mlxbf_i2c_priv *priv,
>  		mlxbf_i2c_smbus_write_data(priv, (const u8 *)&addr, 1,
>  					   MLXBF_I2C_MASTER_DATA_DESC_ADDR, true);
>  		ret = mlxbf_i2c_smbus_enable(priv, slave, read_len, block_en,
> -					 pec_en, 1);
> +					 pec_en, 1, true);
>  		if (!ret) {
>  			/* Get Master GW data descriptor. */
>  			mlxbf_i2c_smbus_read_data(priv, data_desc, read_len + 1,
> @@ -940,6 +955,9 @@ mlxbf_i2c_smbus_i2c_block_func(struct mlxbf_i2c_smbus_request *request,
>  	request->operation[0].flags |= pec_check ? MLXBF_I2C_F_SMBUS_PEC : 0;
>  	request->operation[0].buffer = command;
>  
> +	if (read)
> +		request->operation[0].flags |= MLXBF_I2C_F_WRITE_WITHOUT_STOP;
> +
>  	/*
>  	 * As specified in the standard, the max number of bytes to read/write
>  	 * per block operation is 32 bytes. In Golan code, the controller can
> 
> base-commit: 0a9b9d17f3a781dea03baca01c835deaa07f7cc3
> -- 
> 2.43.2
> 


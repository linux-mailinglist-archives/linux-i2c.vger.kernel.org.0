Return-Path: <linux-i2c+bounces-7619-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5639F9B2510
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 07:08:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 780601C20958
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 06:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 620D318E05A;
	Mon, 28 Oct 2024 06:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pYDfGL39"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A541918DF84;
	Mon, 28 Oct 2024 06:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730095646; cv=none; b=lmweBiN0nqeqOhMbDezQUnDNX/obpvfgSsRncPGxpFsD767BQeEI/r6rCvn6WL7kiPIFixuxIUyg+FIxjsr0qzhxtL/Q9WVZ+TjMU442grhOUp9vouLGgF6D6R6tIJPI8Bmq8uv1Vz6FPt5p1gUuXViyK9b5Y2kFvgtHPx9IldI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730095646; c=relaxed/simple;
	bh=gBXNYcfzuL1+TOm6GW8YcL0Y1gBiJy/HmjEnY6NCbt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GNJkhXZ6rXr7AKDmYHzhT1wDz9HKZhi0IzAQIZU3Zdd0+M6r8Q7pwCAKZm9GNzbMmMdDtZQPvNdW/NKD6ZySYjs7ngsVQOcEWQ8r/RAJnbMW/iKnUp/M0DATItO91RUBSk5zNrjnFT04HeUVnkaJ+7IBl1WMRMA1MuMZ3mOrYfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pYDfGL39; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49RNukGH004754;
	Mon, 28 Oct 2024 06:07:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jJ+7e7uLxKm1G1ZudNv4chOldlM2pFTeP8L9J0w6oGg=; b=pYDfGL39TLEqGlTk
	Q8EmD21F6h45XDlNhuZMSMiwFOzsGkWKplSlwXYTCA3j3EPhn9YKjD2TVdKCUA9Q
	PQ6Of4ub8ZfS5prmaaSFO0oZFDb9h2ACXxmOKLQpTa/ATgw7jyT0jRShvmyrtq6O
	a+ZHxHb7qDqP4eQryNkUNgzVTwaBnILIEtg1MdPubF5oo0G858qLK1pKmW2hjmxv
	ov2udT8+xJQMpAGIlIoQz+HfyBBb6cqPrJ5mi28dU5Kha6nAX1Qi+pwvPh3bxrZN
	DBzeX8JdaVKTYdSeGoRikxsvwRoAUaX89Jgj4HLSJEFN+Qj41Aiwry80D7ba3Tpz
	6ypXiw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gr0x3sf4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 06:07:14 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49S67DI4004525
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 06:07:13 GMT
Received: from [10.217.219.62] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 27 Oct
 2024 23:07:07 -0700
Message-ID: <be5ecd90-040b-4853-9ffa-6512f16e64bc@quicinc.com>
Date: Mon, 28 Oct 2024 11:37:04 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] i2c: i2c-qcom-geni: Add Block event interrupt
 support
To: kernel test robot <lkp@intel.com>, Vinod Koul <vkoul@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Sumit Semwal" <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?=
	<christian.koenig@amd.com>
CC: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
        <cros-qcom-dts-watchers@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, <quic_msavaliy@quicinc.com>,
        <quic_vtanuku@quicinc.com>
References: <20241015120750.21217-6-quic_jseerapu@quicinc.com>
 <202410190549.hGAfByqg-lkp@intel.com>
Content-Language: en-US
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
In-Reply-To: <202410190549.hGAfByqg-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: oHeYzPZ4zvwZEKTYVwMbzBXzxD5G4-Gq
X-Proofpoint-GUID: oHeYzPZ4zvwZEKTYVwMbzBXzxD5G4-Gq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 clxscore=1011 bulkscore=0 adultscore=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280050



On 10/19/2024 3:41 AM, kernel test robot wrote:
> Hi Jyothi,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 55bcd2e0d04c1171d382badef1def1fd04ef66c5]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Jyothi-Kumar-Seerapu/dt-bindings-dmaengine-qcom-gpi-Add-additional-arg-to-dma-cell-property/20241015-202637
> base:   55bcd2e0d04c1171d382badef1def1fd04ef66c5
> patch link:    https://lore.kernel.org/r/20241015120750.21217-6-quic_jseerapu%40quicinc.com
> patch subject: [PATCH v1 5/5] i2c: i2c-qcom-geni: Add Block event interrupt support
> config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241019/202410190549.hGAfByqg-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410190549.hGAfByqg-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410190549.hGAfByqg-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> drivers/i2c/busses/i2c-qcom-geni.c:562:8: error: incompatible pointer to integer conversion passing 'dma_addr_t *' (aka 'unsigned long long *') to parameter of type 'dma_addr_t' (aka 'unsigned long long'); dereference with * [-Wint-conversion]
>       562 |                                    tx_multi_xfer->dma_addr[wr_idx], NULL, NULL);
>           |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>           |                                    *
>     drivers/i2c/busses/i2c-qcom-geni.c:519:36: note: passing argument to parameter 'tx_addr' here
>       519 |                                void *tx_buf, dma_addr_t tx_addr,
>           |                                                         ^
>>> drivers/i2c/busses/i2c-qcom-geni.c:562:47: error: incompatible pointer to integer conversion passing 'void *' to parameter of type 'dma_addr_t' (aka 'unsigned long long') [-Wint-conversion]
>       562 |                                    tx_multi_xfer->dma_addr[wr_idx], NULL, NULL);
>           |                                                                           ^~~~
>     include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
>         8 | #define NULL ((void *)0)
>           |              ^~~~~~~~~~~
>     drivers/i2c/busses/i2c-qcom-geni.c:520:36: note: passing argument to parameter 'rx_addr' here
>       520 |                                void *rx_buf, dma_addr_t rx_addr)
>           |                                                         ^
>>> drivers/i2c/busses/i2c-qcom-geni.c:586:7: error: incompatible pointer to integer conversion assigning to 'dma_addr_t' (aka 'unsigned long long') from 'dma_addr_t *' (aka 'unsigned long long *'); dereference with * [-Wint-conversion]
>       586 |         addr = gi2c_gpi_xfer->dma_addr[gi2c_gpi_xfer->buf_idx];
>           |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>           |                *
>     3 errors generated.

Fixed the reported issues which are comiltation warnings in V2 patch.

> 
> Kconfig warnings: (for reference only)
>     WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
>     Depends on [n]: MAILBOX [=y] && (ARCH_OMAP2PLUS || ARCH_K3)
>     Selected by [y]:
>     - TI_K3_M4_REMOTEPROC [=y] && REMOTEPROC [=y] && (ARCH_K3 || COMPILE_TEST [=y])
> 
> 
> vim +562 drivers/i2c/busses/i2c-qcom-geni.c
> 
>     532	
>     533	/**
>     534	 * gpi_i2c_multi_desc_unmap() - unmaps the buffers post multi message TX transfers
>     535	 * @dev: pointer to the corresponding dev node
>     536	 * @gi2c: i2c dev handle
>     537	 * @msgs: i2c messages array
>     538	 * @peripheral: pointer to the gpi_i2c_config
>     539	 */
>     540	static void gpi_i2c_multi_desc_unmap(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
>     541					     struct gpi_i2c_config *peripheral)
>     542	{
>     543		u32 msg_xfer_cnt, wr_idx = 0;
>     544		struct gpi_multi_xfer *tx_multi_xfer = &peripheral->multi_xfer;
>     545	
>     546		/*
>     547		 * In error case, need to unmap all messages based on the msg_idx_cnt.
>     548		 * Non-error case unmap all the processed messages.
>     549		 */
>     550		if (gi2c->err)
>     551			msg_xfer_cnt = tx_multi_xfer->msg_idx_cnt;
>     552		else
>     553			msg_xfer_cnt = tx_multi_xfer->irq_cnt * NUM_MSGS_PER_IRQ;
>     554	
>     555		/* Unmap the processed DMA buffers based on the received interrupt count */
>     556		for (; tx_multi_xfer->unmap_msg_cnt < msg_xfer_cnt; tx_multi_xfer->unmap_msg_cnt++) {
>     557			if (tx_multi_xfer->unmap_msg_cnt == gi2c->num_msgs)
>     558				break;
>     559			wr_idx = tx_multi_xfer->unmap_msg_cnt % QCOM_GPI_MAX_NUM_MSGS;
>     560			geni_i2c_gpi_unmap(gi2c, &msgs[tx_multi_xfer->unmap_msg_cnt],
>     561					   tx_multi_xfer->dma_buf[wr_idx],
>   > 562					   tx_multi_xfer->dma_addr[wr_idx], NULL, NULL);
>     563			tx_multi_xfer->freed_msg_cnt++;
>     564		}
>     565	}
>     566	
>     567	static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], int cur_msg_idx,
>     568				struct dma_slave_config *config, dma_addr_t *dma_addr_p,
>     569				void **buf, unsigned int op, struct dma_chan *dma_chan)
>     570	{
>     571		struct gpi_i2c_config *peripheral;
>     572		unsigned int flags;
>     573		void *dma_buf;
>     574		dma_addr_t addr;
>     575		enum dma_data_direction map_dirn;
>     576		enum dma_transfer_direction dma_dirn;
>     577		struct dma_async_tx_descriptor *desc;
>     578		int ret;
>     579		struct gpi_multi_xfer *gi2c_gpi_xfer;
>     580		dma_cookie_t cookie;
>     581	
>     582		peripheral = config->peripheral_config;
>     583		gi2c_gpi_xfer = &peripheral->multi_xfer;
>     584		gi2c_gpi_xfer->msg_idx_cnt = cur_msg_idx;
>     585		dma_buf = gi2c_gpi_xfer->dma_buf[gi2c_gpi_xfer->buf_idx];
>   > 586		addr = gi2c_gpi_xfer->dma_addr[gi2c_gpi_xfer->buf_idx];
>     587	
>     588		dma_buf = i2c_get_dma_safe_msg_buf(&msgs[gi2c_gpi_xfer->msg_idx_cnt], 1);
>     589		if (!dma_buf) {
>     590			gi2c->err = -ENOMEM;
>     591			return -ENOMEM;
>     592		}
>     593	
>     594		if (op == I2C_WRITE)
>     595			map_dirn = DMA_TO_DEVICE;
>     596		else
>     597			map_dirn = DMA_FROM_DEVICE;
>     598	
>     599		addr = dma_map_single(gi2c->se.dev->parent,
>     600				      dma_buf, msgs[gi2c_gpi_xfer->msg_idx_cnt].len,
>     601				      map_dirn);
>     602		if (dma_mapping_error(gi2c->se.dev->parent, addr)) {
>     603			i2c_put_dma_safe_msg_buf(dma_buf, &msgs[gi2c_gpi_xfer->msg_idx_cnt],
>     604						 false);
>     605			gi2c->err = -ENOMEM;
>     606			return -ENOMEM;
>     607		}
>     608	
>     609		if (gi2c->is_tx_multi_xfer) {
>     610			if (((gi2c_gpi_xfer->msg_idx_cnt + 1) % NUM_MSGS_PER_IRQ))
>     611				peripheral->flags |= QCOM_GPI_BLOCK_EVENT_IRQ;
>     612			else
>     613				peripheral->flags &= ~QCOM_GPI_BLOCK_EVENT_IRQ;
>     614	
>     615			/* BEI bit to be cleared for last TRE */
>     616			if (gi2c_gpi_xfer->msg_idx_cnt == gi2c->num_msgs - 1)
>     617				peripheral->flags &= ~QCOM_GPI_BLOCK_EVENT_IRQ;
>     618		}
>     619	
>     620		/* set the length as message for rx txn */
>     621		peripheral->rx_len = msgs[gi2c_gpi_xfer->msg_idx_cnt].len;
>     622		peripheral->op = op;
>     623	
>     624		ret = dmaengine_slave_config(dma_chan, config);
>     625		if (ret) {
>     626			dev_err(gi2c->se.dev, "dma config error: %d for op:%d\n", ret, op);
>     627			goto err_config;
>     628		}
>     629	
>     630		peripheral->set_config = 0;
>     631		peripheral->multi_msg = true;
>     632		flags = DMA_PREP_INTERRUPT | DMA_CTRL_ACK;
>     633	
>     634		if (op == I2C_WRITE)
>     635			dma_dirn = DMA_MEM_TO_DEV;
>     636		else
>     637			dma_dirn = DMA_DEV_TO_MEM;
>     638	
>     639		desc = dmaengine_prep_slave_single(dma_chan, addr,
>     640						   msgs[gi2c_gpi_xfer->msg_idx_cnt].len,
>     641						   dma_dirn, flags);
>     642		if (!desc) {
>     643			dev_err(gi2c->se.dev, "prep_slave_sg failed\n");
>     644			gi2c->err = -EIO;
>     645			goto err_config;
>     646		}
>     647	
>     648		desc->callback_result = i2c_gpi_cb_result;
>     649		desc->callback_param = gi2c;
>     650	
>     651		if (!((msgs[cur_msg_idx].flags & I2C_M_RD) && op == I2C_WRITE)) {
>     652			gi2c_gpi_xfer->msg_idx_cnt++;
>     653			gi2c_gpi_xfer->buf_idx = (cur_msg_idx + 1) % QCOM_GPI_MAX_NUM_MSGS;
>     654		}
>     655		cookie = dmaengine_submit(desc);
>     656		if (dma_submit_error(cookie)) {
>     657			dev_err(gi2c->se.dev,
>     658				"%s: dmaengine_submit failed (%d)\n", __func__, cookie);
>     659			return -EINVAL;
>     660		}
>     661	
>     662		if (gi2c->is_tx_multi_xfer) {
>     663			dma_async_issue_pending(gi2c->tx_c);
>     664			if ((cur_msg_idx == (gi2c->num_msgs - 1)) ||
>     665			    (gi2c_gpi_xfer->msg_idx_cnt >=
>     666			     QCOM_GPI_MAX_NUM_MSGS + gi2c_gpi_xfer->freed_msg_cnt)) {
>     667				ret = gpi_multi_desc_process(gi2c->se.dev, gi2c_gpi_xfer,
>     668							     gi2c->num_msgs, XFER_TIMEOUT,
>     669							     &gi2c->done);
>     670				if (ret) {
>     671					dev_dbg(gi2c->se.dev,
>     672						"I2C multi write msg transfer timeout: %d\n",
>     673						ret);
>     674					gi2c->err = -ETIMEDOUT;
>     675					goto err_config;
>     676				}
>     677			}
>     678		} else {
>     679			/* Non multi descriptor message transfer */
>     680			*buf = dma_buf;
>     681			*dma_addr_p = addr;
>     682		}
>     683		return 0;
>     684	
>     685	err_config:
>     686		dma_unmap_single(gi2c->se.dev->parent, addr,
>     687				 msgs[cur_msg_idx].len, map_dirn);
>     688		i2c_put_dma_safe_msg_buf(dma_buf, &msgs[cur_msg_idx], false);
>     689		return ret;
>     690	}
>     691	
> 


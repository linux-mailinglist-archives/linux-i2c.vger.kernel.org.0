Return-Path: <linux-i2c+bounces-12119-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B148B18E7D
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Aug 2025 14:40:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC1B1162AC8
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Aug 2025 12:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D0CF23BCE7;
	Sat,  2 Aug 2025 12:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DOQMtJD9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2F022DFA6
	for <linux-i2c@vger.kernel.org>; Sat,  2 Aug 2025 12:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754138402; cv=none; b=jAaniAAMnaL1rmTSzBj+8iYdNlgwWXyFn/4gdBIgQk0RWoJTU5VbLOC9XRz35wy59PHM+4NdgG0atH2Rt6Z3TfOA4CHjFtTuiNsB64MWRrxR6XHGnn3F98iSLkOAm4wQuPy19jpjX79sHMlhCrU+jKldfuNZiijz1LlIc0HjY4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754138402; c=relaxed/simple;
	bh=20GZjV/9etu8Dh+QrGksTZEKnBLbOiAfPjovI45mWjE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PfvzpQQ7sgNg0kjkN4Vnrpr87/x1YQwBDsHLhcZJYxx6Ez5pAN78/7Vdy928ziq+hmioPj67WbV2hlmajQwumCNPhl39OGJx94h8ESelzfugzKaNWGxW4+6RaINjW5oyyGZ2UVJf4XBh+O+qJ0+rO6+ztWA7A8vH+h3kyv6lPds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DOQMtJD9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5725ewGe017369
	for <linux-i2c@vger.kernel.org>; Sat, 2 Aug 2025 12:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r9VK3kXUy5TNVKQthyOGQ0SFCHNZ+dt1IH8nz2OWv34=; b=DOQMtJD9xjdE7K4H
	vt+tAL+ijFCF/Ppx46PTq6wc0Tn4/X98XLLrGBLGuzMvbAxreC3RezQp8EyPZa0+
	UzJW6dPZmAIDc6+9IQeviwcJmVcn12IlqcBecAfYSutXBJr+KyZvSqxFtgMMo9du
	llmeNIzI2yHwmB8wloQBV8amiGbLg6kLeWquA++hJ11zyqHDF33b7slzh3B0tFYr
	A1fOQ+7KHo3LhiJjF1ji/no0ao8zJy6eh31X7yiFpqa2FD+ip3SBTFBwj/8a5s4d
	xvZZXb4ZGPo/7wRpiihVK7awCZ1GbbBUY6miBEig1e3yCvdFUp5HadPxMnra5b45
	h8VRQw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4899pa8w69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Sat, 02 Aug 2025 12:39:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ab3bd0f8d5so6687611cf.1
        for <linux-i2c@vger.kernel.org>; Sat, 02 Aug 2025 05:39:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754138398; x=1754743198;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r9VK3kXUy5TNVKQthyOGQ0SFCHNZ+dt1IH8nz2OWv34=;
        b=iFinIB9y/1dEOxHRY3wZFLYKkJtsIUPLj/CBSxDz2rApRTO8nKpc6Mp9AW4Q7bJK3m
         A20ISUdLjsj+dVoocC/PhnIoNl448Mc6cEVpdsHcp/PTsbks1EiUnhOsEyJaKLdE/kjq
         80OHhzOEqpY0pmO3s6cC+0+tBEv9tW5uXGVzlXlsfPoHL4LcHbdvNBYcWTZs17E3RYFo
         23MWrWsYJWyCwJKVGgFdbb7+C5FN/pe+G/NX2IodWM5lIHstEhJTZao/ptX57JWjm9nj
         obygQzQTtRlLCJrv5SvIXao9LsyAUmciBegoIBIJrb6+A3Bbe/eN9OdcBpQudkuiev/f
         w9Rg==
X-Forwarded-Encrypted: i=1; AJvYcCXZ9hB45KeCqwB0QecSM74kqH3Qu43xrnTjCtt7KL0LBOP+Z8q49K3GM2GYYY0syUgLOd0koHkP7tw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp7zQfzSg8qEoaH3sJd/m/g+azypDwAk5Lk6mHLIgA7FCRkT81
	wdsleA9gDlws9JHORLLayfeHadKNs3WK6wv7kW6mj+mQqlDe7sOKW2/F+FkTs9rvG23nxLolp40
	JlsJJt130w1kGnjNjbrdNorA2o2wrjVOAxx+IC6cw+5qn1vZWT3gNLNKjkDz5MVA=
X-Gm-Gg: ASbGnctx8AeLB5v5ApnEUP0Rn4V+cXn/MCykZFWvWxXCvAR8ViSaszRPjlhOab3sriE
	PG+6ZY+KxHrXXqNPdlihsfIPFKhlvf1JMW4MwsxP90OVR1rbI7XqU5aP0FUCn5Zsg6LiL3ctvP5
	Y6mLZUmv2q3rwhNJSQObLfxamehtaQ5bIJBrivXHy3BnjcmsGQFul02siVi7rJszzMHiimhPIMg
	zGXGrTMB3fIQd9nnh4d9+lzvVCyC9zwvK4urjnX0hPiWFzxVvPfq0s3dcTQ3zeG+U4Dm5ODjdjO
	pkG6fgAVn8OGDeX1HqrMxC5472EdCss8gbg/lHV87Muq64nJbB3hNm38P59tU6pYyHjUbSEbCqB
	7bqT9riPWxpeBDnRZyA==
X-Received: by 2002:ac8:5f90:0:b0:4ab:5ac3:1347 with SMTP id d75a77b69052e-4af10a84c91mr23333931cf.13.1754138398218;
        Sat, 02 Aug 2025 05:39:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEm4NEl6EUx3LCCGFmAhcLGEPc2/M/pvg1mmL0vg2ErLHKHgVKDYHB4PV/P/gfOCagScMPDYw==
X-Received: by 2002:ac8:5f90:0:b0:4ab:5ac3:1347 with SMTP id d75a77b69052e-4af10a84c91mr23333291cf.13.1754138397693;
        Sat, 02 Aug 2025 05:39:57 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8fe77cfsm4167407a12.42.2025.08.02.05.39.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Aug 2025 05:39:57 -0700 (PDT)
Message-ID: <e0886f9e-bcc1-48dc-a175-2147d8d4fc3e@oss.qualcomm.com>
Date: Sat, 2 Aug 2025 14:39:48 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/6] dmaengine: qcom: gpi: Accept protocol ID hints
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Sven Peter <sven@kernel.org>,
        Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Neal Gompa <neal@gompa.dev>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Frank Li <Frank.Li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Taichi Sugaya <sugaya.taichi@socionext.com>,
        Takao Orito <orito.takao@socionext.com>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?=
 <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?Q?Am=C3=A9lie_Delaunay?= <amelie.delaunay@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai
 <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Laxman Dewangan
 <ldewangan@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Michal Simek <michal.simek@amd.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
        =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-actions@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-spi@vger.kernel.org
References: <20250730-topic-dma_genise_cookie-v1-0-b505c1238f9f@oss.qualcomm.com>
 <20250730-topic-dma_genise_cookie-v1-3-b505c1238f9f@oss.qualcomm.com>
 <CAMuHMdV0JO=qtregrrHsBZ-6tpNdPUj3G1_LWRfRsj0vBb+qyw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMuHMdV0JO=qtregrrHsBZ-6tpNdPUj3G1_LWRfRsj0vBb+qyw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAyMDEwNSBTYWx0ZWRfX1CJ/zF225LbZ
 aJtmNgRR/fAiY5ycirZlcxymHc+CT5Z5Sju+3eLgzhUpmLeNiS/Zt8MuUgMi4+JWVp1oFPd6m/1
 iGWD0OaMBq499EqH77+EM4vSHEQ3N1NhbNxEWK22kn3plsYKFf1NQ3fuxiI59IO1Lb05oQdpLgl
 RskEVbd+cg+XvSa4Y0XT0/ukTqwQaCCiwmaEpaVdAn/lZP/tOnJgT8GYuOfUdH+hoUv1W3/j84H
 5dRHjQKDftssC5F/Fk86Ql0p0mOSYur2hAA3/ltPT+t3NUT5gPtqGn6TQSIzeRan4QIDo6Co70O
 IDgNmkWtBNUoI3E1BJotn5jsgbHNyO1nKTZ/hc3d6ezperocl1NDGzveVD1GUb7EZZfI1CZezzN
 XbNhOxNdZ0bdqy4Aou+9d2UssT7hWHaNaAM+KcAry/qyJnufAwmK60q29mtBqDl4vlFZJECe
X-Proofpoint-GUID: dy6uaGY-rSKGVmX6FwIw6Md8DieB64K9
X-Authority-Analysis: v=2.4 cv=N88pF39B c=1 sm=1 tr=0 ts=688e071f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=sidZTQT7lcrlHK7IIakA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: dy6uaGY-rSKGVmX6FwIw6Md8DieB64K9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_08,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 mlxlogscore=864 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508020105

On 7/30/25 1:32 PM, Geert Uytterhoeven wrote:
> Hi Konrad,
> 
> On Wed, 30 Jul 2025 at 11:35, Konrad Dybcio <konradybcio@kernel.org> wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Client drivers may now pass hints to dmaengine drivers. GPI DMA's only
>> consumers (GENI SEs) need to pass a protocol (I2C, I3C, SPI, etc.) ID
>> to the DMA engine driver, for it to take different actions.
>>
>> Currently, that's done through passing that ID through device tree,
>> with each Serial Engine expressed NUM_PROTOCOL times, resulting in
>> terrible dt-bindings that are full of useless copypasta.
>>
>> To help get rid of that, accept the driver cookie instead, while
>> keeping backwards compatibility.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/dma/qcom/gpi.c
>> +++ b/drivers/dma/qcom/gpi.c
>> @@ -2145,7 +2151,8 @@ static struct dma_chan *gpi_of_dma_xlate(struct of_phandle_args *args,
>>         }
>>
>>         gchan->seid = seid;
>> -       gchan->protocol = args->args[2];
>> +       /* The protocol ID is in the teens range, simply ignore the higher bits */
>> +       gchan->protocol = (u32)((u64)proto);
> 
> A single cast "(uintptr_t)" should be sufficient.
> Casing the pointer to u64 on 32-bit may trigger:
> 
>     warning: cast from pointer to integer of different size
> [-Wpointer-to-int-cast]

Good point, not compiling for 32-bit always ends up biting.. thanks

Konrad


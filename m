Return-Path: <linux-i2c+bounces-14325-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B2DC8E185
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 12:48:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55A843AB95E
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 11:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0747032BF48;
	Thu, 27 Nov 2025 11:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ir8pvPzj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j8L0HwPu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3DC299924
	for <linux-i2c@vger.kernel.org>; Thu, 27 Nov 2025 11:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764244087; cv=none; b=iMNCjWuXAwz6byhwpL3aZVKPPLz0ViXjuIBtc3PQFWjGvnItBNXhBnjyk/GfaWHL26ysI3ETeiNLGWEuYbmomDhXJORzC71nOSVh/lWVKTF2GHiOwbGdHrWEerfxNXpoaE7AVT78klP2QdQRCVDmVADsaCQtWUSCZ0ooDTk4Ejw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764244087; c=relaxed/simple;
	bh=nKkbcqfYG3LHG04a4RygWErz9v8LS6PmuMbISXn6AZo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=S0JuHBV0uOG9Kspsb2krbbOj9uUdd0UCTWT2FBbvYZa7tPW3SYOOFHjEhOgQECLTu4zFYgw/EJkPT+i99/kvP7O6k2oMvpcryK4kZWQC4dMXVADVi6ZyZlScxXPDhdE8lCWCqUGA6D/Mh6M/xKM84ETSVqk73EQQXsM5j9Nyi5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ir8pvPzj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j8L0HwPu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AR99aan1667748
	for <linux-i2c@vger.kernel.org>; Thu, 27 Nov 2025 11:48:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fIhJipMQ82A8oHOXTJVIJ6g6TYjckyt6+XKNV8hShGU=; b=Ir8pvPzjvFpmI3Qj
	0jIZnpxA3DEwegMteN8JROxPskNkQc3lQnleuAnXf9CHemvf/7w7Osz664I3c5yI
	5EQEQrHBUijbciNdQNdnhZYfyLTBubdqssdAfd7/XE4HOu380ZFGtT03cOIihB/C
	A2LPYNczLg4j8v5EflWz7Kz9jv1XW5/ratAuI48hyL2KeMkvNWnnoz+LJSTSgp/P
	ZohEIzqALKyjdbBsHFZaf2W7JDGJn3QF8xtx/bSuKRJW5jvg9Y1z7bNQYfbglXqF
	HF5B0bNkjzTmwy+y26sGQgv62N5clU4enjYbHBLPLks0jgrGdlY4Fv6a/Hx0GIjY
	I+nyQQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0bmup02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 27 Nov 2025 11:48:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee27e24711so12319831cf.1
        for <linux-i2c@vger.kernel.org>; Thu, 27 Nov 2025 03:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764244085; x=1764848885; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fIhJipMQ82A8oHOXTJVIJ6g6TYjckyt6+XKNV8hShGU=;
        b=j8L0HwPun+7rMYOfS2UwFnsMis1885Hj8FtcTpMhYO2YIFjkRneJ0QDxWMuaRIWWe3
         A0Tr7L8EPtkc8Wm+nnZ6UrG7Blkd8gN3R70FFzDs+t7g0bVdjLxod4+i7eFL/6YPb1A7
         qItySn+5e6GVzCdDRTpeGd16Lfja+q1Ylmg/lUMalpLO0LJecRJJtO8kaLCGwgaidmot
         6iOgA6No3NppnKcxyXDbRdY8+Nxqf1okvuvYt7p/epG3IXE1YGf8G83uBrKngAqlBn8D
         rjFScFPjPs2bh6HEtIhOEwNAZFXY0yfG5/vQZhXNIJ7mGuaqPUvLOLLB61Jh6CSqJil2
         +ocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764244085; x=1764848885;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIhJipMQ82A8oHOXTJVIJ6g6TYjckyt6+XKNV8hShGU=;
        b=Ta5b9HLwH7PecH3Op+f0KZiNhQbWgzIGzgaxqH4L7BTbYPqcpSriwZ9HfhyZrD2xs5
         L1Je5gg3mKecepC7XQC0KPoiU2i0cho8XrQXReioW+yR8JHIpcrpa4twPutagI8GCxdk
         zh9jkCkWOdaLKHOttzPCDLhWzYdPvYagOe++AZrqgwPXWSDmpltv7L8n9YMDmAM1aUNy
         VpaAUgpowHRI9dQZQFxA6glk0HuLfpW0We2uVqR/Mw3YUSBZurNjb8rds4aoswN2EEsk
         DjS5yJVISPmKRMjeGgHfncCvJRX7hZrgunMai+YW6i4H3O3j/3hY+FZa1RwNzclLbjkM
         uSTg==
X-Forwarded-Encrypted: i=1; AJvYcCW/ZhQIZFZmgNHcPIzwvbOVhGsqG5fRhsNQnASCqNTbKcEGj59VKnBuTDj0mrTI3Vz8gjBq+CJRP8I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Doi6S9eTRk7sdPlkCh9Oax3DFei2u8dsIqiUyRVWOd5X1jj2
	niR4pVVs1ZZ7bULlT1lvjkyWy+ugEwKUI9A7FOtWkD93uywbn+qUya8pJbk4t7zHSQkfehHLVWr
	Pav7NOqbsUDAwYOIBjPzjMDnvout8hmMxa4OhVxfVxv89i7bvTxblfJOIcOKusxM=
X-Gm-Gg: ASbGncs3d2+HYhDCXF8hn0iFvxNnSG5kSar+Up4sVyQOKF7705hAZXchi6M8G8jNZ8a
	+xEV3P00Jcl0Si5otVJHRWCqzob2NKDUPe36wmhoVyQjU1DuUzAq6K8IkarWFSoeVDlThT+dCwJ
	ZnzS2676mHLhv1yXIsCjIH+O9H3Vj7n9txTxtkeSP4JnyS/QMHePfTINsPLCoH5jI60YfInk2bh
	rYCUzVoj6u+h5mwnXBDGZZNIu7Ps1q8JQb0puH2TCDxPH55WuezdSh2toQPRrDmoPTPdoO+ct4o
	PwNMYJ4G47XtmGEe4/IrhwFrL8EbJxxxWTA02110iL1WTwI6Q2UPR3g3i1yS/vvcI23NaEzw/fF
	8oIP9c5QbIQr6LzzGEGZNQwNQWRMszaBE+rFOww==
X-Received: by 2002:a05:622a:c8:b0:4ec:d893:a0fc with SMTP id d75a77b69052e-4ee58a850fdmr327423671cf.4.1764244084755;
        Thu, 27 Nov 2025 03:48:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnK3g/Js45TQqWNMcc2jVyW7gCrAWjZ1laKZXs6iAR7ymEJl4EhBft8ZMZWlF9n0vQcP/u6Q==
X-Received: by 2002:a05:622a:c8:b0:4ec:d893:a0fc with SMTP id d75a77b69052e-4ee58a850fdmr327423421cf.4.1764244084319;
        Thu, 27 Nov 2025 03:48:04 -0800 (PST)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64751050a63sm1383268a12.24.2025.11.27.03.48.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 03:48:03 -0800 (PST)
Message-ID: <0e90817e-1c05-4fa3-a6fd-8e755608a2c9@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 12:48:01 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] i2c: rcar: Fix Wvoid-pointer-to-enum-cast warning
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, llvm@lists.linux.dev
References: <20251126182257.157439-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20251126182257.157439-6-krzysztof.kozlowski@oss.qualcomm.com>
 <CAMuHMdX7t=mabqFE5O-Cii3REMuyaePHmqX+j_mqyrn6XXzsoA@mail.gmail.com>
 <dbb94fb1-2f78-4bd2-9254-c435ab3325c0@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTpLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQG9zcy5xdWFsY29tbS5jb20+wsGXBBMB
 CgBBFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmkknB4CGwMFCRaWdJoFCwkIBwICIgIGFQoJ
 CAsCBBYCAwECHgcCF4AACgkQG5NDfTtBYpuCRw/+J19mfHuaPt205FXRSpogs/WWdheqNZ2s
 i50LIK7OJmBQ8+17LTCOV8MYgFTDRdWdM5PF2OafmVd7CT/K4B3pPfacHATtOqQFHYeHrGPf
 2+4QxUyHIfx+Wp4GixnqpbXc76nTDv+rX8EbAB7e+9X35oKSJf/YhLFjGOD1Nl/s1WwHTJtQ
 a2XSXZ2T9HXa+nKMQfaiQI4WoFXjSt+tsAFXAuq1SLarpct4h52z4Zk//ET6Xs0zCWXm9HEz
 v4WR/Q7sycHeCGwm2p4thRak/B7yDPFOlZAQNdwBsnCkoFE1qLXI8ZgoWNd4TlcjG9UJSwru
 s1WTQVprOBYdxPkvUOlaXYjDo2QsSaMilJioyJkrniJnc7sdzcfkwfdWSnC+2DbHd4wxrRtW
 kajTc7OnJEiM78U3/GfvXgxCwYV297yClzkUIWqVpY2HYLBgkI89ntnN95ePyTnLSQ8WIZJk
 ug0/WZfTmCxX0SMxfCYt36QwlWsImHpArS6xjTvUwUNTUYN6XxYZuYBmJQF9eLERK2z3KUeY
 2Ku5ZTm5axvlraM0VhUn8yv7G5Pciv7oGXJxrA6k4P9CAvHYeJSTXYnrLr/Kabn+6rc0my/l
 RMq9GeEUL3LbIUadL78yAtpf7HpNavYkVureuFD8xK8HntEHySnf7s2L28+kDbnDi27WR5kn
 u/POwU0EVUNcNAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDy
 fv4dEKuCqeh0hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOG
 mLPRIBkXHqJYoHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6
 H79LIsiYqf92H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4ar
 gt4e+jum3NwtyupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8
 nO2N5OsFJOcd5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFF
 knCmLpowhct95ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz
 7fMkcaZU+ok/+HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgN
 yxBZepj41oVqFPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMi
 p+12jgw4mGjy5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYC
 GwwWIQSb0H4ODFH41ZZ3t1Qbk0N9O0FimwUCaBdQXwUJFpZbKgAKCRAbk0N9O0Fim07TD/92
 Vcmzn/jaEBcqyT48ODfDIQVvg2nIDW+qbHtJ8DOT0d/qVbBTU7oBuo0xuHo+MTBp0pSTWbTh
 LsSN1AuyP8wFKChC0JPcwOZZRS0dl3lFgg+c+rdZUHjsa247r+7fvm2zGG1/u+33lBJgnAIH
 5lSCjhP4VXiGq5ngCxGRuBq+0jNCKyAOC/vq2cS/dgdXwmf2aL8G7QVREX7mSl0x+CjWyrpF
 c1D/9NV/zIWBG1NR1fFb+oeOVhRGubYfiS62htUQjGLK7qbTmrd715kH9Noww1U5HH7WQzeP
 t/SvC0RhQXNjXKBB+lwwM+XulFigmMF1KybRm7MNoLBrGDa3yGpAkHMkJ7NM4iSMdSxYAr60
 RtThnhKc2kLIzd8GqyBh0nGPIL+1ZVMBDXw1Eu0/Du0rWt1zAKXQYVAfBLCTmkOnPU0fjR7q
 VT41xdJ6KqQMNGQeV+0o9X91X6VBeK6Na3zt5y4eWkve65DRlk1aoeBmhAteioLZlXkqu0pZ
 v+PKIVf+zFKuh0At/TN/618e/QVlZPbMeNSp3S3ieMP9Q6y4gw5CfgiDRJ2K9g99m6Rvlx1q
 wom6QbU06ltbvJE2K9oKd9nPp1NrBfBdEhX8oOwdCLJXEq83vdtOEqE42RxfYta4P3by0BHp
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <dbb94fb1-2f78-4bd2-9254-c435ab3325c0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AKyLkLWT c=1 sm=1 tr=0 ts=69283a75 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=BwDcOSWodqSW4K7DrzcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDA4NyBTYWx0ZWRfXwsgk/HcQpQrp
 vu0tf0ZsMoq6rWfnD8A/G+hNB5uhtSZo7zOK4Gf12r5ITuT8V/92jkyS9r0TkNpxHwg1/0Uya2e
 dBS4xw+fMmS9DqZ4aWtAzfyYxENUhksvTTZ3IprD6yuzELbER3Of8hPI2Aw+JOPISwaqBSkI5so
 5sUW22Q7Yyu7gpILG1uyw95lA/3dYnfbU1vm8xvBYiukuki8rfE/9tjnrunY72oe22DpevIGFvV
 gaJsvJl3FdJp9YuGpSyZwhXPXY0SEXUCVaYN5pLAtOnDrn0PJdkbLBamjOaJjQSJ/MLc5Zb9Tt8
 RifpmN4DAQB4WbI704b+Yelnea4mBRmgdmwYf79CWD0FKSmEZ8Cz1++W7g4ApU1Hy+X76MeM2j2
 ls14y6NOoa5JH/n9aFZPuKLAE+H+NA==
X-Proofpoint-GUID: 3Km-gbR6KqyTrI6WkR1s1aaOFlOOeak0
X-Proofpoint-ORIG-GUID: 3Km-gbR6KqyTrI6WkR1s1aaOFlOOeak0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511270087

On 27/11/2025 12:42, Krzysztof Kozlowski wrote:
>>
>> =
>>> --- a/drivers/i2c/busses/i2c-rcar.c
>>> +++ b/drivers/i2c/busses/i2c-rcar.c
>>> @@ -1141,7 +1141,7 @@ static int rcar_i2c_probe(struct platform_device *pdev)
>>>         if (IS_ERR(priv->io))
>>>                 return PTR_ERR(priv->io);
>>>
>>> -       priv->devtype = (enum rcar_i2c_type)of_device_get_match_data(dev);
>>> +       priv->devtype = (kernel_ulong_t)of_device_get_match_data(dev);
>>
>> Any specific reason you picked "kernel_ulong_t" instead of "unsigned long"?
>> The former seems to be the least common option.
> 
> As I wrote in the first patch, because to my knowledge it is the
> preferred form for holding driver data which are in general pointers. We
> do not store pointers as unsigned long. It is also already used for the
> driver data types - see include/linux/mod_devicetable.h.

... and in case it is still not obvious: I do not cast here to final
type, because that cast is the reason for the warning.

I cast to an intermediary type to help compiler suppressing the warning
- to integer representing the pointer. Unsigned long is not representing
pointers in the kernel. Integer type representing the pointer is
kernel_ulong_t, I think.

Once you have integer type representing the pointer, you do not need
further casts to enum.

> 


Best regards,
Krzysztof


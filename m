Return-Path: <linux-i2c+bounces-10833-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A992AAD33C
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 04:22:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48FE21C00988
	for <lists+linux-i2c@lfdr.de>; Wed,  7 May 2025 02:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86BD3190072;
	Wed,  7 May 2025 02:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XadjY22r";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="A1lmtwrR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E81BA38;
	Wed,  7 May 2025 02:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746584526; cv=fail; b=snMc7MH0Ir4innrDlFDnfQXz1wFIuVqqZhCyu5vOZLOtje2sMtAVzvnG1KTbl8d6s1J+O6n6BsA/ypyQ/r23blJjmdYe9AwY8nhS+/qQWpPmBZZ6sUDY3kj0gt3NVNyqX1IoefKOaAESH92jku11r9tylGKJmEgFVQO5jTG0Bto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746584526; c=relaxed/simple;
	bh=GluePGWht1SURfP5/UkH/9/mOhY5Vq0e3ycU3fGeCtc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PsWUHfVQDRiNQpken9ggtUSvRyJOOdIS8vMxllRv46pQqQ57HsAlyrzAMtVFoM1IKSgLzj/NJXHw4gZ1d9sy29//Gnuvpwqqqa63nZVbGnk0MjmoouCV8iNauqn2vYcfH5Ho33Rep2JMztcb01p2SW0hDMWITNOq3u3/BVgID6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XadjY22r; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=A1lmtwrR; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5472Dv2E007442;
	Wed, 7 May 2025 02:21:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=QwIuH0RWvNXWLWqiJKJpwkNfHDry1mCxTU368Z4JTCA=; b=
	XadjY22rk4ObNFM5JAm6MqWmJZHmUz70AsyHuJi1TEC1Md6Sg9NTdj3uJFS6Re0j
	x1df8094pR0FEM+94G45gZQP8knmjbXRGZ6N7VMf6Pzb7TccVZT3vQgLPP2RajV+
	Qn0vBAcuZeFWDzrsfF2Fo1Ojz29WSAce7cAy/HGyTodrsatAdbcKBjwsEjOKurdy
	Fh6jin6qoSkW2Mh3ssDpZQztfgXFko8VJ1v9tmsLC/rolZZ/1lfO6jg3AMGduidh
	xCr+bXLONO2ASzGOsKkC1sNT0J01FfSUKOONXn7a3S+oKUnUM1Ozoe1Y8eF284g0
	ET9Y9aq3ALI8z2XtaH88nA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46fxhbr0q3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 07 May 2025 02:21:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5471ChlC036206;
	Wed, 7 May 2025 02:21:32 GMT
Received: from cy4pr05cu001.outbound.protection.outlook.com (mail-westcentralusazlp17010000.outbound.protection.outlook.com [40.93.6.0])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46d9kajh2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 07 May 2025 02:21:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PNCwGZ0nSxWhXLb0fUEE55sfznv2J0BfBuHeKER7G01WJ8ys8j6nE+8szqGcUau7gT5+V9u5wBd3l3RWolSB6RpSsmEQcSTspOD5xBaf49jGswAZoVutk05TT5bhrQTKmHWacYi0WGU2sqPW5SMzI2pf23kmcIBNMgpqA8gDE3loxeXbt7b9ZoAdCBOKbhqquLPA9FbuK0yJRcozAym9/S4+LJ75a2ZMYrC03ZZImbkJFUdoYJiw/CXi1Ta68iHioWV/Is70EbShfKvwYwK4+oE0DvSsBa+rEYlHfSTDCCSnT6rPGQBQ2CV6sY0hR2pKXwhnYyC3NtNi6S+Xyg7t2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QwIuH0RWvNXWLWqiJKJpwkNfHDry1mCxTU368Z4JTCA=;
 b=eLPVUwz/qGNcBRP4Xb+sDPK3p2KvfUE6V4RlvZIATURdLY9vdMnN1/tD31kvYhDfmJbjyUQIAqvbVvZ+JQUoQfTb9bqLiBEiJOIwfUPQKhW03RCh1wReUdXHLeYAfypQHaQ4b119weIhSXttGOJiFppkopdjJquhzJ3CBit3lRQ48LiiRaCq2EIxca3IsywH4JHCc2BUS5fo8qp4EO6LmTrL5TciBKRAE90X/wlimduRxlN8r1zbKbK5BqD6P8qUUq/KR7RNtquEEtmUQUIVdrE41L2ofWGx30K4NSjXn6r0hK6LPIlYSRGB50Gafr7a3n7fAWrS8ZdbDqGF4xr1uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QwIuH0RWvNXWLWqiJKJpwkNfHDry1mCxTU368Z4JTCA=;
 b=A1lmtwrRQnHpiQI4L8hjCyxs/nIBsY9von6DSvDgPsoAq5DYoowiQqzxdm3szsWG4mc7MLDOb7bEbzIktDm5ze4nbYPLiosCOOkfNRWuBU36OR2wp2EdrYsUUVkbfKm/Gnxnu05kupoXv3eGwb4WTzG6fb9cHRVZppsnCpgtwRA=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by SA6PR10MB8136.namprd10.prod.outlook.com (2603:10b6:806:438::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Wed, 7 May
 2025 02:21:26 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%2]) with mapi id 15.20.8699.022; Wed, 7 May 2025
 02:21:26 +0000
Message-ID: <d15e5b43-f0bd-466a-9a2a-790eb0cf0c48@oracle.com>
Date: Wed, 7 May 2025 07:51:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] i2c: i2c-qcom-geni: Add Block event interrupt
 support
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, quic_vtanuku@quicinc.com
References: <20250506111844.1726-1-quic_jseerapu@quicinc.com>
 <20250506111844.1726-3-quic_jseerapu@quicinc.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250506111844.1726-3-quic_jseerapu@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::7) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|SA6PR10MB8136:EE_
X-MS-Office365-Filtering-Correlation-Id: bf81c720-c4b5-4a03-d22c-08dd8d0dde34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YTNtYVBGVUFpNXZ3a3ZXbXVPVFdWNjNqeC9oeCtJbmlrSXUyNkpCRVM3MDBR?=
 =?utf-8?B?K1NETHdXRy9QdXRMTW5CWVRhVlpLemgvSndMdDVEcTlnWXVYVlZFcE9ZNERW?=
 =?utf-8?B?dmp4cWlxZ281dTYvMFkwQXVod3M4eW1OdnFRYWd3ODBDTnJzQ2NoT0xiUUpM?=
 =?utf-8?B?YTV2dDRNWkp5b2VJTDRHS09XMFFYUEU1ZVhSVW9XdXRQcXVuNlJ1VWxUVEc0?=
 =?utf-8?B?UDRnV0VYbVdlMTJuQlJKU1gzcXJlemtPSlFNZ3JJdS9ac3J2alFrU3NlbGUw?=
 =?utf-8?B?dTZhU2wvK3RwM3pqMEY3M0xwczliTXlhMjBySDB0YmRsYzI4bmZmQTBBdEkw?=
 =?utf-8?B?LzNrRHRZL0k1WXRXWW9jQVY4bGY5MDlBbFVEdkNwWElRcElVRHVvcTRXd2dr?=
 =?utf-8?B?TU9xNEVybUMyVFdBT2JrY3RRcGFBSTdFU1JNSWgyMXVweTRnQi9WcTR3bVND?=
 =?utf-8?B?QjVrb3ZvQ2ZpR0ZWQzIweWMyTm45dEZ2MWF3QU5wTU82dEluY3dyNDFFWi9u?=
 =?utf-8?B?N0lIY29mcXBDYVh3Z2FDREt6T0FpYkFQdEx6S0Z5c2M1a1IrdjIxbm5GMkJX?=
 =?utf-8?B?aktUcm1LcTdiYzlkcUZYOHQ2ZWVUL0pKczVrYW9uOXR1QkF0RWN4dy9MQzlI?=
 =?utf-8?B?dXplWEhsM1g3OW1wTDB3Unp5ZEZmL0xXNFlDWDQyUVJzaDJCN3hZNzZNYmFE?=
 =?utf-8?B?Ly9WNW1xLzhyNHQ0bXkxaTFUbUtHY2c1dUZXT3ZobnFGMFJKSGJyVGpwNU5L?=
 =?utf-8?B?MkpjZE5pWE1TMUNqLy9YeElRMEtVbWl6RmZ0eXV5aUNiR1RNMVpBdG9GQ0lR?=
 =?utf-8?B?WDN6VTNxRFV3WnRWNDMvZGJDZ0JVUG9CSG5HQk9ab1l5MzR2SWRmZi81TTdB?=
 =?utf-8?B?bHJncG85Ny94MVRxcVNWUFBVNWhxU2wyeWhjZmNlK05QL2VBdTFJOS9ueGlj?=
 =?utf-8?B?N3MzTjFTdkYwV0F1L2xsRXQzL2kvV3lEUTdnY0tqRlVuQmhBTTlza1lyTVZk?=
 =?utf-8?B?SC80cDg5SUZaUklBYnllZGpqVnJkZjR4NS9XMWp0aDZuMzJHK2xIQVdIdmda?=
 =?utf-8?B?MGxjMDc4aG9zd0hyVjRIOUFlbFg5aG00TE5TSi9KRzR3bzh5b0VaMTRPU3VI?=
 =?utf-8?B?T3UyQlc5Nkk0UjJ5UktlNTVUQkpPUEZZKzVYeExVNGJaVXNRUUhraXZvbXpL?=
 =?utf-8?B?N3ZUTHRxakxqQ3R2NHNSWkUwd01XTjVoUVR6ODZpbjVwSEc0Z216WTNNcm01?=
 =?utf-8?B?OUZ2WlFMakFjdVdKZE40SmhUNzF4MW9yNEhlZm1TR0l3ZjVuU2xjM3FlWllV?=
 =?utf-8?B?RnlaV1JBWmFDWG51VzNZdTMzd21XUW15WW5wRm9UeDZ0aEVhMHBtS0t5Y05j?=
 =?utf-8?B?V2dpYys5WGZLNVlWa1pTUW1vNzJUeTdKZnF1Zk1WVHlDUU44c1NBTW1uYksr?=
 =?utf-8?B?R0dUR0dsRDFpK2plMGw1c0V2TXJZeExSVHZDZWZ6cWlwUWo2OXNHeGhiNHdz?=
 =?utf-8?B?YWxaM2ptL3hOYVVGZWpOT1l2TGJEWE5sN0g3WVRDRGNSMHpVd0NtMS9za3pP?=
 =?utf-8?B?L3AwSDdjdkxsRCtRQjZGc1VMWXV5dmdxbnB1WjlkVVRUa3VVUjhqSzhSOGtM?=
 =?utf-8?B?U3VnSVZTNUwwSEFIcFhGckNtSEpwcDNBWDIwQVo3bVNmeXdzSzlxTVF3WTNp?=
 =?utf-8?B?RHBDbzhrcHZxQXIyaGQ3NGZua1ZORTZFcGJBNHpVYWFaTWtYb09XSTcvK0k0?=
 =?utf-8?B?ejVTNUxpWm1MZitaZUQvcW9YaDhaUXR0US9EV2hEN1hKblowalZocFdvMGVY?=
 =?utf-8?B?ZDQwa2d3QjNDYUYzaWp6ZFBHTCtzY3ZEMjY5OGk3WVN6Ty9MQUlCbEo2R0Fi?=
 =?utf-8?B?U0t1YWtUd3cyUzRRcGw1enpZdUQzQXFyQVlVcUU5RStZaE1NS1RYd0ZMOENz?=
 =?utf-8?Q?P0BgXYZOZAU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZStNN2hOeE9yaHloUnRTSmxBYXlLVG0xWW4yOW54b00xaC90NDRLQjlZN2NG?=
 =?utf-8?B?Y0xqVDQrL3EzcUw1QXNUZkZReUNuaTA2bUhVVGVzeVhVK0xHTDMyZ251a0Mz?=
 =?utf-8?B?bnFLM3ZwaG0zQUhIMkZFc3hQU0Q5UjREa2lTZGFwVG1rTnF1Vlh6eDdVRFNT?=
 =?utf-8?B?SUp3cUhqS0tLcU81aDNlcVFHVGJBWmtKU1ZhclJjQ2I5blhMK3V0WE1Tb0Fz?=
 =?utf-8?B?Yy9ZdjdSbzhrU3lLTFpELy82ZFZaQ3orSkQyYTV1RkduYi9mRityeFJPWlVJ?=
 =?utf-8?B?Y2hsM0gwK3pjbndoYlpXRGFLTEg5K0RYU0gzOGpsUEdGY04ySjNwVGxiWDdQ?=
 =?utf-8?B?ejE4eElMVTA3ckRRVzlBYzRyRkM3NVZQY093TDhQR2l4WUVhSjdPS0FRNzF0?=
 =?utf-8?B?ZjFVMjhCU1g1UUNzcWkxaUFCSFNvS1pockkvWFdCLzR2WmN5bEgvM3l2UGdU?=
 =?utf-8?B?cGVWazRPQllUWU9vVkhQM3YwTzdHT0pER0hqRFZxMHU2T0FUVFR1YjdhRHQx?=
 =?utf-8?B?THBwZnl5NkFuWk9sb0NVRzNjVUtuZWFEVWlnTDJNYnJNV2JwakNBSVpmeXlr?=
 =?utf-8?B?ZEVxZk44MXV1ZGdsc1c4R3dUQU5FWDJ6aWFrMXBWWUMxcDlJS3o1UzA0UE85?=
 =?utf-8?B?Ujlvem5YbU9OeGM0TXphUUJ4VlhyS3hteVV5azY1V0tmZUNGTUkzOEVFYUYr?=
 =?utf-8?B?VlZEb1Z5Z1drU2EzNHBTWlNTZFJicHZZditvTCtUc2RSSnNUUVFmcHI3Mm1B?=
 =?utf-8?B?a0RueUlmTHVoeUtlT2YyU3VBdUxDQTRRbzBYOHNSVDVXSVRjanFMdUdOZUJV?=
 =?utf-8?B?c2ZWYjFZQy9tSmVyVHJvWXhwcEt3UnJ1aWNIMlNOZlJiUGtOeUk2RkJSN2Zu?=
 =?utf-8?B?WE1EQVBXbUM5ZE84SFErSVZjT09kU0UveHJsa0FhRENTRXkyWlZSeTVqU3FE?=
 =?utf-8?B?VVNYbGRqWDFFa3UrZ3QvOG1WRTFIZGV1QUl3cVZOMzVxTXVTc2l4QWZmY3Vt?=
 =?utf-8?B?ei9jVU9xaGsyS29ibHpBbnJHbTdkWDk5K3V0YTJZNGRXRk1QdTRWSXRTTWZa?=
 =?utf-8?B?aUljbmRBV1pFamtvRlZnaHdBNHBtSXJCdW1yN2ZRakdON1FrTWFwVlFIWThU?=
 =?utf-8?B?Q0hnRzl1NFpab0M3VldqTEFSVUZUbFJFVFVrT2ZIQzk4VzI5b3VEbTk4Mllp?=
 =?utf-8?B?OWI0dmRuVjJmTTh5MXBlRkc0NkhtT3YyR3BxL1dsd2JIS0pITXZ4OXBVT054?=
 =?utf-8?B?MnJzb2w5eU1IbkxOemk5ZmNCckMrUndOc21FbmhSQ2RhZ0pjN01jc3psWnBv?=
 =?utf-8?B?d3F1emI1Ylpod1dscUhEZG9kNnNjVmErdjZUS2tBenlOR1JudlFqNUd2VjQr?=
 =?utf-8?B?L0VnSGpjT2xKaEJzcmRPQzJFZXQxbGowdHZ4WU9kSEVZSjgweWN5Wjd2Z1Zt?=
 =?utf-8?B?bGVmSktoejN5OGJWL0I4UmtNWDVpSEdZS1g3dFlHUEw3S3VNZCtUWVZHN0c2?=
 =?utf-8?B?NGNGQ3FnWkZhYkFsTW5zMk01eHc0MHFNOEhSNTBwQkF2SktGcUhYZGRRZDhQ?=
 =?utf-8?B?SVArMmxPaWlCSHg5QTE3UUQ3NUVEWGZRSU4rNU05ZDVlWkFkMlQ1TVVrbzFw?=
 =?utf-8?B?L1IwYVFsVlJXTUo1akRNTStZNDRkaXBuWlRsMVVEQW9qUHEvKy9XcERJRWxq?=
 =?utf-8?B?QmlPSGROMW9TcFlYN0VWeU9qMmFWOXpyanNkOCtVQ0VlQnQvaGlsYUxhTkVT?=
 =?utf-8?B?WG9pRFZxSXRXemp5ZFdobldycWFJV2IvZ3VTQU9QZlJzVHRFUlg3SGxOZzlW?=
 =?utf-8?B?MFB1YmFtY0MydDdnL2JRY2NoQlJSTEtHdTB2ZWdOZEM0Rnk2T1htNUhOcXBC?=
 =?utf-8?B?RkFtK3lkUEFiajk3eU5aY0NJcjRFRjVza1g2dGJPYkJlaFo4VDU0QUNwZncx?=
 =?utf-8?B?NlZsdytSWWI1ZXRsK0drVzRkY2hCOGhsTGkzT0tUTHBoc0JzYk5jSVBOY2Vy?=
 =?utf-8?B?cjB3Ynphb3VoclFNc3ErNWNxM09DMGtmUVpkSHBFb3FhekdrWkM4Y2cxYjNN?=
 =?utf-8?B?YUhGYkdIS3EzNm5UUGN5UFdwR1RxbEhEZVM3elhqbTA3Q3lJVEh6enpQT2FN?=
 =?utf-8?B?dXh1emU4OXdzbzV2NmNpNXFoK3VNVlQ5bXNSbUhCUERaUVB0dFJXUVIvOFNB?=
 =?utf-8?B?Tmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	myLQC4AjmMgZ/Sxzze4zf1oywgWoZDl8HvhbBkO0byXC0kXZIPucb0pKONTtcjWOoYnZ0MJrz/41X3T3XCPjUhAqStoeUO5uiUJiC3pMdiO72P+Y2NscGnhJK4/8Kwh0ZfMZfYX3IreZ112tTB2IjK/jH2fgk8DsRc9qUYs7c1WYS/AnAHHPYxJ+GzL9ORU/7R1et6ifKXEt4x5GPhhr7ynw7qMExHS6iUzL3KL0MVTz44TY9nqQBhlgShwp4/4AWdwqfaxepwZEyO3MIOHH4JTElwYYY8Edb90RZAh0arDxWnbFbRWLCdeG26WmH7aCxHhsSg9rvS3oD3YZwfSI2B88SlPIfBh/UxiepoFOstOOkSGtUPaFPSt1XM+uvP78vpi81bQDai0tQ81PQN0NWv/m6KbgtD3L4x85ffstv4r705QKhEV5mXcspsEkZiOyQ4EkBwmvfa52VqnSo4NKxVfcCDqBNFzX4VQ5vvOfeC9KMphKVz16cx2hAIh5bhN+XNlr3CJ/yThmD7hXhvCNDuhdVYmAAG+d92G4Un067+pA3F1yql6wAXqEni940aRWRH0XgME1sDUpovdk6N3QEUrA+GqdAt/5b8AhRPMMMtg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf81c720-c4b5-4a03-d22c-08dd8d0dde34
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 02:21:26.4663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rj8QjDvneLMtY+bwdbO+v+UnG4AVjua2GntlMaCktUgOq0qfLaMtvR/GZAGSsquzXenuXT6Y/6qTe5fyJNjPi1cwAE0FKhE8pVP4yCITWBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8136
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_01,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 phishscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505070020
X-Proofpoint-GUID: zlJpiLxR5IEAA0ZOEDoziU-1P7G9sbma
X-Proofpoint-ORIG-GUID: zlJpiLxR5IEAA0ZOEDoziU-1P7G9sbma
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDAyMSBTYWx0ZWRfX3k9I661nNI6r BOoCyWI44XzmYkKl3iheijoFquu632tjFfxcYnls3sK3SG43Dbrqm2IHQdHNjR5nyKeParaxR8o q/AFT9ET1lVkYW5plXWj0Lr9TFEY9SRaina/M8rKr+nWx1xjOd1R8V2fLQPfxy4jKa4EL5jqdoU
 Gf8akmDM6ctzMrCsAi0/FgFrUewpbiI0YLD/puJV2EgvDeDdcztb9X/W40vrBR7dFYq7aBvM0Dk kaKYABNr4CwPP436/033Y7bWON3HWEvRrbtEQQiuFToWzjTfMo5KOV4+nsx1IsaCZOqyEgHlmqR LdDvUTNj/aAZ3HUlRmHIhUpf/fkY79j/8gj1leDsQTplkAlLPgfZMxLAQYC4QkZF6dEKY64YDb+
 c4m2Z0v3zSwuWk3RfF26rYjx0/R9R0PQ/fnFtabapRUZU6m8Gu15Zsg79mXiD6qLGIe+kr83
X-Authority-Analysis: v=2.4 cv=a6kw9VSF c=1 sm=1 tr=0 ts=681ac3b3 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=jmoNZHb8NQZqa-d7vREA:9 a=QEXdDO2ut3YA:10



On 06-05-2025 16:48, Jyothi Kumar Seerapu wrote:
> +/**
> + * struct geni_i2c_dev - I2C Geni device specific structure
> + *
> + * @se: geni serial engine
> + * @tx_wm: Tx watermark level
> + * @irq: i2c serial engine interrupt
> + * @err: specifies error codes in i2c transfer failures
> + * @adap: i2c geni adapter
> + * @done: completion variable
> + * @cur: pointer to the i2c_msg mentioning current i2c message in use
> + * @cur_wr: variable used for i2c write opertions

typo opertions -> operations

> + * @cur_rd: variable used for i2c read operations
> + * @lock: spinlock variable used for synchronization
> + * @core_clk: pointer to clk
> + * @clk_freq_out: contains the i2c clock frequency
> + * @clk_fld: pointer to geni_i2c_clk_fld
> + * @suspended: flag used for system supend status

typo supend -> suspend

> + * @dma_buf: virtual address of the buffer
> + * @xfer_len: holds length for the dma operation
> + * @dma_addr: dma address of the buffer
> + * @tx_c: Tx dma channel
> + * @rx_c: Rx dma channel
> + * @gpi_mode: GPI DMA mode of operation
> + * @abort_done: true for marking i2c abort transfer
> + * @is_tx_multi_desc_xfer: true for i2c multi transfer support
> + * @num_msgs: number of i2c messages in a transfer
> + * @tx_irq_cnt: flag used for tx irq count in i2c multi transfer
> + * @i2c_multi_desc_config: used for multi transfer support
> + */
>   struct geni_i2c_dev {
>   	struct geni_se se;
>   	u32 tx_wm;
> @@ -100,6 +156,10 @@ struct geni_i2c_dev {
>   	struct dma_chan *rx_c;
>   	bool gpi_mode;
>   	bool abort_done;
> +	bool is_tx_multi_desc_xfer;
> +	u32 num_msgs;
> +	u32 tx_irq_cnt;
> +	struct geni_i2c_gpi_multi_desc_xfer i2c_multi_desc_config;
>   };
>   


Thanks,
Alok

